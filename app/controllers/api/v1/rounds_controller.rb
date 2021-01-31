class Api::V1::RoundsController < ApplicationController
  skip_before_action :verify_authenticity_token

# POST api/v1/rounds
  def create
    map = Map.where(name: params['map']).first_or_create!
    GameSession.create!(map: map) if current_game_session&.map != map
    round = Round.new(win_reason: nil, game_session: current_game_session)
    server_error unless round.save
    save_round_users(params['innocents'], { role: 'innocent'})
    save_round_users(params['detectives'], { role: 'detective'})
    save_round_users(params['traitors'], { role: 'traitor'})
    save_round_users(params['spectators'], { role: 'spectator'})
    success
  end

  def end
    current_round.update(win_reason: params['reason'])
    save_round_users(params['result']['dead'], { survived: false })
    save_round_users(params['result']['survived'], { survived: true })
  end

 private
  def server_error
    render nothing: true, status: :internal_server_error
  end

  def success
    render nothing: true, status: :ok
  end

  def save_round_users(users, collection_params)
    users.each do |user_data|
      user = User.find_by_steam_id(user_data['user_steam_id'])
      PingSample.create(user: user, ping: user_data['ping'])
      update_params = collection_params.merge({ karma: user_data['karma'],
                                                score: user_data['stats']['score'],
                                                credits: user_data['credits'] })
      RoundParticipant.where(user: user, round: current_round).first_or_create.update(update_params)
    end
  end
end
