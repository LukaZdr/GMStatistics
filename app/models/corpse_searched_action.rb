class CorpseSearchedAction < UserRoundAction
  JSON_SCHEMA = Rails.root.join('config', 'schemas', 'corpse_searched_data.json_schema').to_s
  validates :data, json: { schema: JSON_SCHEMA }


  def self.build(params, round)
    user = User.find_by_steam_id(params['user_steam_id'])
    # TODO Needs Ping
    # create_user_ping_sample((params['ping'], user)
    CorpseSearchedAction.new(user: user,
    round: round
    data: {
        # corpse_was_traitor: params['corpse_was_traitor'], # Doesnt actually need the field due to  serverinfo
        is_covert: params['is_covert']
        whose_corpse: params['corpse_steam_id'] # Can you pass an ActiveRecord Passing?
    },
    time: ApplicationRecord.epoch_to_datetime(params['time'])
    )
  end
end