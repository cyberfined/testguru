class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true, uniqueness: { scope: :level, case_sensitive: false }
  validates :timer, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  def has_timer?
    timer.present?
  end

  def self.tests_titles_by_category(category)
    joins(:category).where(categories: { title: category }).pluck(:title)
  end
end
