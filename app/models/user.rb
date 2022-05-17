class User < ApplicationRecord

  devise :database_authenticatable,
        :registerable,
        :recoverable,
        :rememberable,
        :trackable,
        :validatable,
        :confirmable

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :gists
  has_many :feedbacks
  has_many :awards
  has_many :badges, through: :awards

  def tests_by_level (level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.is_a?(Admin)
  end

end
