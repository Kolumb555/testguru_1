class Question < ApplicationRecord
  belongs_to :test
  has_many :replies

  validates :title, presence: true
  validates :body, presence: true

end
