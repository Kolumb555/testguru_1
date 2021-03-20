class QuestionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy]

  def edit

  end

  def index

  end

  def show

  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      render plain: 'New question was added to database'

    else
      render plain: 'Question was not added to database'
    end
  end

  def destroy
    @question.destroy
    
    redirect_to tests_path
  end

  private

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
