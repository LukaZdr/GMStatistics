class PlayerWasKilledAction < UserRoundAction
  JSON_SCHEMA = Rails.root.join('config', 'schemas', 'player_was_killed_data.json_schema').to_s
  validates :data, json: { schema: JSON_SCHEMA }


  def self.build(params, round)
    # TODO Stuff...
  
  end

end


=begin
{"victim":{"steam_id":"Trunksx3","ping":44.0},"time":1611694969.0,"cause":"prop_physics","action":"player_was_killed"}
{"victim":{"steam_id":"Power-Elch","ping":29.0},"time":1611694972.0,"cause":"ent_explosive_melon","action":"player_was_killed","attacker":{"steam_id":"Kieth Er'Brocken","ping":52.0}}
{"victim":{"steam_id":"Waldemar Wald Wald","ping":5.0},"time":1611694980.0,"cause":"Kieth Er'Brocken","action":"player_was_killed","attacker":{"steam_id":"Kieth Er'Brocken","ping":54.0}}
=end