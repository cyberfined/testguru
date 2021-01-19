class Test < ApplicationRecord
  def self.tests_titles_by_category(category)
    Test.joins('INNER JOIN categories AS C ON category_id = C.id').
      where('C.title = ?', category).
      pluck(:title)
  end
end
