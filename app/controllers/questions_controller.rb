class QuestionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy]

  def index

  end

  def show

  end

  def new
  
  end

  def create
    question = @test.questions.new(question_params)
  end

  def destroy
    @question.destroy
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
