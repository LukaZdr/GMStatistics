class Api::V1::RoundController < ApplicationController
  skip_before_action :verify_authenticity_token

# POST api/v1/round
  def create
    map = Map.where(name: params['map']).first_or_create!
    
    GameSession.create!(map: map) if current_game_session&.map != map

    round = Round.new(innocent_win: nil, game_session: current_game_session)

    server_error unless round.save

    success
  end

 private
  def current_game_session
    GameSession.last
  end

  def server_error
    render nothing: true, status: :internal_server_error
  end

  def success
    render nothing: true, status: :ok
  end
end
