class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  scope :easy_tests, -> { where(level: 0..1) }
  scope :medium_tests, -> { where(level: 2..4) }
  scope :hard_tests, -> { where(level: 5..Float::INFINITY) }

  def self.tests_titles_by_category(category)
    joins(:category).where(categories: { title: category }).pluck(:title)
  end
end
