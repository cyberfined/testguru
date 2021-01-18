class User < ApplicationRecord
  has_many :user_answer_mappings
  has_many :answers, through: :user_answer_mappings
  has_secure_password
end
