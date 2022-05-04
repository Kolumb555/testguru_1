class Question < ApplicationRecord
  belongs_to :test
  has_many :replies, dependent: :delete_all

  validates :body, presence: true

end
