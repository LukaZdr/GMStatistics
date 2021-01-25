class User < ApplicationRecord
  validates :name, presence: true
  validates :steam_id, presence: true
end