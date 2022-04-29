class FeedbackMailer < ApplicationMailer

  def feedback_email(feedback)
    @user = feedback.user
    @feedback = feedback

    mail(to: ENV['SMTP_USERNAME'], subject: "Feedback from #{@user.email}")
  end
end
