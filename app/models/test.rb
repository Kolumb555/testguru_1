class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4)}
  scope :hard, -> { where(level: 4..Float::INFINITY)}
  scope :tests_by_category, -> (cat_title) { where(categories: { title: cat_title }).pluck(:title)}
  scope :tests_by_level, -> (level) { where(tests:  { level: level }) }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true }
  validates :level, numericality: { greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  # def self.tests_by_category(cat_title)
  #   Test.joins('JOIN categories ON tests.category_id = categories.id').where(categories: { title: cat_title }).pluck(:title)
  #end
end