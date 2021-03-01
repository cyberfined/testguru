class Rule < ApplicationRecord
  validates :title, uniqueness: true
end
