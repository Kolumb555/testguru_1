class Reply < ApplicationRecord
  belongs_to :question

  scope :right, -> { where(correct: true) }
end
