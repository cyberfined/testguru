class User < ApplicationRecord
  has_many :user_answer_mappings
  has_many :answers, through: :user_answer_mappings
  has_secure_password

  def passed_tests_by_level(level)
    Test.joins('INNER JOIN questions AS Q ON Q.test_id = tests.id').
      joins('INNER JOIN answers AS A ON A.question_id = Q.id').
      joins('INNER JOIN user_answer_mappings AS M ON M.answer_id = A.id').
      where('M.user_id = ? AND tests.level = ?', id, level).
      distinct.
      pluck(:title)
  end
end
