class Test < ApplicationRecord
  def self.tests_titles_by_category(category)
    category = Category.find_by(title: category)
    if category.nil?
      []
    else
      Test.where(category_id: category.id).order(title: :desc).pluck(:title)
    end
  end
end
