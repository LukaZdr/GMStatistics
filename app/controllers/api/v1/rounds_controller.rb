class Api::V1::RoundsController < ApplicationController
  skip_before_action :verify_authenticity_token

# POST api/v1/round
  def create
    map = Map.where(name: params['map']).first_or_create!
    GameSession.create!(map: map) if current_game_session&.map != map
    round = Round.new(innocent_win: nil, game_session: current_game_session)
    server_error unless round.save
    save_round_users('innocent', params['innocents'])
    save_round_users('detective', params['detectives'])
    save_round_users('traitor', params['traitors'])
    save_round_users('spectator', params['spectators'])
    success
  end

  def update
    current_round.update(win_reason: params['reason'])

    # save in roundparticipant if he/she survied the round
    # ping
  end

 private
  def server_error
    render nothing: true, status: :internal_server_error
  end

  def success
    render nothing: true, status: :ok
  end

  def save_round_users(role, users)
    users.each do |user_data|
      user = User.find_by_steam_id(user_data['user_steam_id'])
      PingSample.create(user: user, ping: user_data['ping'])
      RoundParticipant.create(user: user, round: current_round, role: role, karma: user_data['karma'])
    end
  end
end
