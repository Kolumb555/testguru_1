class Feedback < ApplicationRecord
  belongs_to :user

  validates :subject, presence: true
  validates :comment, presence: true
  
end
