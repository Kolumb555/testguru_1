class Test < ApplicationRecord
  def self.tests_by_category(cat_title)
    Test.joins('JOIN categories ON tests.category_id = categories.id').where(categories: { title: cat_title }).pluck(:title)
  end
end