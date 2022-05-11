class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create

    @feedback = current_user.feedbacks.new(feedback_params)

    if @feedback.save

      FeedbackMailer.feedback_email(@feedback).deliver_now
      redirect_to tests_path, notice: t('.success')
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:subject, :comment, :user_id)
  end

end
