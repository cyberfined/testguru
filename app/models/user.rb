class User < ApplicationRecord
  has_secure_password
  has_many :results, dependent: :delete_all
  has_many :tests, through: :results
  has_many :created_tests, class_name: 'Test', foreign_key: 'creator_id', dependent: :destroy

  def passed_tests_by_level(level)
    Test.joins('INNER JOIN results ON results.test_id = tests.id').
      where(results: { user_id: id }, level: level).
      pluck(:title)
  end
end
