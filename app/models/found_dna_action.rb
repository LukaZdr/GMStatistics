class FounDNAAction < UserRoundAction
  JSON_SCHEMA = Rails.root.join('config', 'schemas', 'found_dna_data.json_schema').to_s
  validates :data, json: { schema: JSON_SCHEMA }

  def self.build(params, round)
    user = User.find_by_steam_id(params['user_steam_id'])
    # TODO ping is missing
    # create_user_ping_sample(params['ping'], user)
    # create_user_ping_sample(params['ping'], user)
    FounDNAAction.new(user: user, round: round,
      data: {
        suspect: params['suspect_steam_id'],
        scanned_object:  params['scanned_ent']
      },
      time: ApplicationRecord.epoch_to_datetime(params['time']))

  end
end
