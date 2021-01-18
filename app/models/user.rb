class User < ApplicationRecord
  has_many :user_answer_mappings
  has_many :answers, through: :user_answer_mappings
  has_secure_password

  def passed_tests_by_level(level)
    questions = Question.find(answers.map(&:question_id))
    Test.where(id: questions.map(&:test_id), level: level)
  end
end
