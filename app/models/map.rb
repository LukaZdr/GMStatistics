class Map < ApplicationRecord
  has_many :game_sessions
  validates :name, presence: true
end
