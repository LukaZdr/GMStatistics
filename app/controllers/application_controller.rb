class ApplicationController < ActionController::Base
  def current_game_session
    GameSession.last
  end
end
