class Test < ApplicationRecord
  has_one :category
  has_many :questions
  has_many :users, through: :user_tests
  has_one :user

  def self.tests_by_category(cat_title)
    Test.joins('JOIN categories ON tests.category_id = categories.id').where(categories: { title: cat_title }).pluck(:title)
  end
end