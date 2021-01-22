class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  def self.tests_titles_by_category(category)
    joins(:category).where(categories: { title: category }).pluck(:title)
  end
end
