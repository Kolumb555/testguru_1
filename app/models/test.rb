class Test < ApplicationRecord
  has_one :category
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  def self.tests_by_category(cat_title)
    Test.joins('JOIN categories ON tests.category_id = categories.id').where(categories: { title: cat_title }).pluck(:title)
  end
end