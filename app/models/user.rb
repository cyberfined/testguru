class User < ApplicationRecord
  has_secure_password

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'creator_id', dependent: :destroy

  validates :login, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true

  def passed_tests_by_level(level)
    tests.where(level: level).pluck(:title)
  end

  def test_passage(test)
    passage = test_passages.order(id: :desc).find_by(test_id: test.id)
    return passage unless passage.nil? || passage.current_question.nil?
  end
end
