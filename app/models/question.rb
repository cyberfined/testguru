class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :statement, presence: true
  validate :validate_num_answers

  private

  def validate_num_answers
    unless answers.count.between?(1, 4)
      errors.add(:answers, 'number must be greater than or equal to 1 and less than or equal to 4')
    end
  end
end
