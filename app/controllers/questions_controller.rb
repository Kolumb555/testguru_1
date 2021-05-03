class QuestionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  before_action :find_test, only: %i[index]
  before_action :find_question, only: %i[show]

  def index

  end

  def show

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
end
