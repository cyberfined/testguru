class Answer < ApplicationRecord
  belongs_to :question

  validates :statement, presence: true

  scope :correct, -> { where(correct: true) }
end
