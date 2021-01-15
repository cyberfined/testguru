class Test < ApplicationRecord
  belongs_to :level
  belongs_to :category
  belongs_to :user
end
