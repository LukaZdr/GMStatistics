class Round < ApplicationRecord
  belongs_to :game_session
  has_many :round_participants
  has_many :users, through: :round_participants
end
