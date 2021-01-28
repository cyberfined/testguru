class Answer < ApplicationRecord
  MAXIMUM_ANSWERS = 4

  belongs_to :question

  validates :statement, presence: true
  validate :validate_num_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_num_answers
    if question.answers.count > MAXIMUM_ANSWERS-1
      errors.add(:question, 'has maximum number of answers')
    end
  end
end
