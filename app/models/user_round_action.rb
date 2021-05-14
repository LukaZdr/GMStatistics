# frozen_string_literal: true

class UserRoundAction < ApplicationRecord
  # all action types should be written so that its clear witch user is ment. user ... {action_type}
  ACTION_TYPES = {
    'picked_up_weapon' => PickedUpWeapon,
    'bought_equipment'=> BoughtEquipment,
    'corpse_searched'=> CorpseSearchedAction, # TODO - how to save victim inside json?
    'found_dna'=> FounDNAAction, # TODO - how to save victim inside json?
    'player_hurt'=> PlayerHurtAction,  # TODO - how to save victim inside json, waaaay to complex?
    'revived_player'=> nil,  # TODO - couldnt find reference 
    'player_was_killed'=> PlayerWasKilledAction }.freeze # TODO - complex

    ACTION_TYPE_PAYLOAD_VALIDATION = {
      'corpse_searched'=> Rails.root.join('config', 'schemas', 'corpse_searched_data.json_schema').to_s
    }

  validates :data, json: { schema: ACTION_TYPE_PAYLOAD_VALIDATION[self.type] }

  belongs_to :user
  belongs_to :round

  validates :type, presence: true
  validates :time, :data, presence: true

  def self.create_user_ping_sample(ping, user)
    PingSample.create(user: user, ping: ping)
  end
end