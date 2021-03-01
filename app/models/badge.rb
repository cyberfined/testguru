class Badge < ApplicationRecord
  belongs_to :rule
  has_and_belongs_to_many :users

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :image_url, presence: true
  validates :rule_argument, numericality: { only_integer: true }
end
