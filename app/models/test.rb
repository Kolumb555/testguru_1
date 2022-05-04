class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :delete_all
  has_many :test_passages, dependent: :delete_all
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User'

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4)}
  scope :hard, -> { where(level: 4..Float::INFINITY)}
  scope :by_category, -> (cat_title) { joins(:category).where('categories.title = ?', cat_title) }
  scope :tests_by_level, -> (level) { where(tests:  { level: level }) }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true }
  validates :level, numericality: { greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  def self.tests_by_category(cat_title)
    by_category(cat_title).order(title: :desc).pluck(:title)
  end
end