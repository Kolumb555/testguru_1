class Question < ApplicationRecord
  belongs_to :test
  has_many :replies, dependent: :destroy

  validates :body, presence: true

end
