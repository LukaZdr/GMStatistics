class User < ApplicationRecord
  validates :name, presence: true
  validates :steam_id, presence: true
  has_many :login_times
  has_many :round_participants
  has_many :round, through: :round_participants

  def current_round_participant
    round_participants.last
  end
end
