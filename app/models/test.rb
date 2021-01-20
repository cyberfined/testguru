class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User'
  has_many :questions
  has_many :results
  has_many :users, through: :results

  def self.tests_titles_by_category(category)
    Test.joins('INNER JOIN categories ON category_id = categories.id').
      where(categories: { title: category }).
      pluck(:title)
  end
end
