# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_game_session
    GameSession.last
  end

  def current_round
    Round.last
  end

  def epoch_to_datetime(epoch)
    DateTime.strptime(epoch.to_s, '%s')
  end
end
