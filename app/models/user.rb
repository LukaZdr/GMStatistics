class User < ApplicationRecord
  validates :name, presence: true
  validates :steam_id, presence: true
  has_many :login_times
end
