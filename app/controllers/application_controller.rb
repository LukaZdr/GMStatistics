class ApplicationController < ActionController::Base
  def current_game_session
    GameSession.last
  end

  def current_round
    Round.last
  end
end
