class Rule < ApplicationRecord
  has_many :badges, dependent: :destroy

  validates :title, uniqueness: true
end
