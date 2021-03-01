class Badge < ApplicationRecord
  belongs_to :rule

  validates :rule_argument, numericality: { only_integer: true }
end
