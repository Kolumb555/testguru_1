class Question < ApplicationRecord
  belongs_to :test
  has_many :replies

  validates :body, presence: true

end
