class Test < ApplicationRecord
  def self.tests_by_category(cat_title)
    cat_id = Category.where('title = ?', cat_title)
    Test.where(category_id: cat_id).select(:title).order('title DESC')
  end
end