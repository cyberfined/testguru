class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :git_hash, presence: true
  validates :url, presence: true
end
