class Badge < ApplicationRecord
  belongs_to :rule
  has_and_belongs_to_many :users

  validates :rule_argument, numericality: { only_integer: true }
end
