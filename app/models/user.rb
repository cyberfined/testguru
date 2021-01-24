class User < ApplicationRecord
  has_secure_password

  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :created_tests, class_name: 'Test', foreign_key: 'creator_id', dependent: :destroy

  validates :login, presence: true
  validates :password, presence: true

  def passed_tests_by_level(level)
    tests.where(level: level).pluck(:title)
  end
end
