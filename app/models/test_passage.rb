class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  SUCCESS_PERCENT = 85
  
  def completed?
    current_question.nil?
  end

  def accept!(reply_ids)
    if correct_reply?(reply_ids)
      self.correct_questions += 1
    end

    save!
  end

  def correct_replies_percent
    (self.correct_questions * 100 / test.questions.count)
  end

  def test_passed?
    correct_replies_percent >= SUCCESS_PERCENT
  end

  def question_number
    current_question.id - test.questions.first.id + 1
  end

  def questions_qty
    test.questions.count
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_reply?(reply_ids)
    correct_replies.ids.sort == reply_ids.map(&:to_i).sort
  end

  def correct_replies
    current_question.replies.right
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
