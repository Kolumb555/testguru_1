class RepliesController < ApplicationController

  before_action :find_question, only: %i[new create]
  before_action :set_reply, only: %i[show edit update destroy]

  def new
    @reply = @question.replies.new
  end

  def update

    if @reply.update(reply_params)
      redirect_to @reply.question
    else
      render :edit
    end
  end

  def create
    @reply = @question.replies.new(reply_params)

    if @reply.save
      redirect_to @reply, notice: 'Reply created'
    else
      render new
    end
  end

  def show

  end

  def destroy
    @reply.destroy
    
    redirect_to questions_path
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:body, :correct)
  end
end
