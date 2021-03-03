class Rule < ApplicationRecord
  has_many :badges, dependent: :destroy

  validates :title, presence: true
  validates :title, uniqueness: true
end
