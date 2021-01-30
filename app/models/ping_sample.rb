class PingSample < ApplicationRecord
  belongs_to :user
  validates :ping, presence: true
end