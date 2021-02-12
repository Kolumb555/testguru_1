class Reply < ApplicationRecord
  belongs_to :question

  scope :right, -> { where(correct: true) }

  validates :body, presence: true

  validate :validate_max_replies, on: :create

  def validate_max_replies
    errors.add(:base, 'Not more than 4 replies per question') if question.replies.count > 4
  end

end
