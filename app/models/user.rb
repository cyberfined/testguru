class User < ApplicationRecord
  has_secure_password

  def passed_tests_by_level(level)
    Test.joins('INNER JOIN results ON results.test_id = tests.id').
      where(results: { user_id: id }, level: level).
      pluck(:title)
  end
end
