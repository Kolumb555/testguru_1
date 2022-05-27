class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result gist]

  def show

  end

  def result

  end

  def gist
    gist_question = GistQuestionService.new(@test_passage.current_question)
    result = gist_question.call
    gist_url = result.html_url

    flash_options = if gist_question.success?
                    save_gist(gist_url)
                    { notice: t('.success', url: gist_url) } 
                  else
                    { alert: t('.failure') }
                  end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:reply_ids])

    if @test_passage.completed? || @test_passage.time_is_up?
      @test_passage.test_passage_passed?
      TestsMailer.completed_test(@test_passage).deliver_now
      @badges = AwardGiveService.new(@test_passage).call if @test_passage.passed?
      redirect_to result_test_passage_path(@test_passage)
    else
    render :show
    end
  end

  private

  def save_gist(url)
    current_user.gists.create(question: @test_passage.current_question, gist_url: url)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
