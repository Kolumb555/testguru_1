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
    test_passage_passed?

    save!
  end

  def test_passage_passed?
    self.passed = test_passed?
  end

  def correct_replies_percent
    (self.correct_questions * 100 / test.questions.count)
  end

  def test_passed?
    return correct_replies_percent >= SUCCESS_PERCENT if test.timer == 0
    correct_replies_percent >= SUCCESS_PERCENT && (deadline > Time.now)
  end

  def question_number
    current_question.id - test.questions.first.id + 1
  end

  def questions_qty
    test.questions.count
  end

  def time_left
    self.created_at + (test.timer * 60).seconds - Time.now
    # Time.at(self.created_at + (test.timer * 60).seconds - Time.now).utc
  end
  
  def deadline
    self.created_at + test.timer.minute
  end

  def time_is_up?
    return false if test.timer == 0
    deadline.past?
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_reply?(reply_ids)
    if reply_ids
      correct_replies.ids.sort == reply_ids.map(&:to_i).sort
    end
  end

  def correct_replies
    current_question.replies.right if current_question
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
