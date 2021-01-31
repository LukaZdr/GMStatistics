# frozen_string_literal: true

class Round < ApplicationRecord
  belongs_to :game_session
  has_many :round_participants
  has_many :users, through: :round_participants

  def over?
    win_reason.present?
  end
end
