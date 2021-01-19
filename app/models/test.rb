class Test < ApplicationRecord
  def self.tests_titles_by_category(category)
    Test.joins('INNER JOIN categories ON category_id = categories.id').
      where('categories.title = ?', category).
      pluck(:title)
  end
end
