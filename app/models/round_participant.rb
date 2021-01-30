class RoundParticipant < ApplicationRecord
  USER_ROLES = ['innocent', 'detective', 'traitor', 'spectator'].freeze
  validates :role, inclusion: { in: USER_ROLES, message: "%{value} is not a valid role"}
  validates :role, :karma, presence: true
  belongs_to :user
  belongs_to :round
end