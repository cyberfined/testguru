class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'creator_id', dependent: :destroy
  has_many :gists, dependent: :destroy
  has_and_belongs_to_many :badges

  validates :first_name, length: { minimum: 3 }
  validates :last_name, length: { minimum: 3 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }
  validates :password, confirmation: true

  def show_initials
    "#{first_name} #{last_name} #{email}"
  end

  def admin?
    is_a?(Admin)
  end

  def passed_tests_by_level(level)
    tests.where(level: level).pluck(:title)
  end

  def test_passage(test)
    passage = test_passages.order(id: :desc).find_by(test_id: test.id)
    return passage unless passage.nil? || passage.completed?
  end
end
