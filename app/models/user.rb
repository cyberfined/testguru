class User < ApplicationRecord
  has_secure_password

  def passed_tests_by_level(level)
    Test.joins('INNER JOIN results ON results.test_id = tests.id').
      where('results.user_id = ? AND tests.level = ?', id, level).
      pluck(:title)
  end
end
