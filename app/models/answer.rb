class Answer < ApplicationRecord
  has_many :user_answer_mappings
  has_many :users, through: :user_answer_mappings
end
