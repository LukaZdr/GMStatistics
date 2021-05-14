class PlayerHurtAction < UserRoundAction
  JSON_SCHEMA = Rails.root.join('config', 'schemas', 'player_hurt_data.json_schema').to_s
  validates :data, json: { schema: JSON_SCHEMA }


  def self.build(params, round)
    target = params['target']
    inflictor = params['inflictor']
    weapon = params['weapon']

    user = User.find_by_steam_id(params['user_steam_id'])

    PlayerHurtAction.new(
      user: user,
      round: round
      data: {
          # corpse_was_traitor: params['corpse_was_traitor'], # Doesnt actually need the field due to  serverinfo
          is_covert: params['is_covert']
          whose_corpse: params['corpse_steam_id'] # Can you pass an ActiveRecord Passing?
      },
      time: ApplicationRecord.epoch_to_datetime(params['time'])
    )
  end

=begin

  {"time":1611694734.0,
    "target":
    {
      "steam_id":"Power-Elch",
      "position":"[-904.7317 2295.9712 42.0816]",
      "health_before_hurt":100.0,
      "ping":28.0,"volicity":"[164.2431 82.5191 0]"
    },
    "was_headshot":false,
    "damage_points":9.899999618530274,
    "damage_type":["bullet","always gib"],
    "action":"player_hurt",
    "inflictor":
    {
      "steam_id":"niniramy",
      "ping":65.0,
      "position":"[-1182.9009 1200.5107 208.0313]",
      "volicity":"[0 0 0]"
    },
    "weapon":"weapon_ttt_sg552"}

{"time":1611694829.0,
"target":
{
  "steam_id":"Power-Elch","
  position":"[-2151.3596 1772.3442 48.03]",
  "health_before_hurt":100.0,"ping":22.0,
  "volicity":"[-14.0016 49.5431 -69.3904]"
},
"was_headshot":false,
damage_points":71.670654296875,
"damage_type":["blast","blast surface"],
"action":"player_hurt",
"weapon":"prop_physics"
}

{"time":1611694969.0,
"target":
{
  "steam_id":"Kieth Er'Brocken",
  "position":"[-1394.6226 1335.1719 33.3712]",
  "health_before_hurt":100.0,
  "ping":47.0,
  "volicity":"[-153.3815 159.3903 -483.5]"
  },
"was_headshot":false,
"damage_points":7.551818370819092,
"damage_type":["fall"],
"action":"player_hurt",
"weapon":"worldspawn"
}

=end

end