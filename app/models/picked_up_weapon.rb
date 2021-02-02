# frozen_string_literal: true

class PickedUpWeapon < UserRoundAction
  JSON_SCHEMA = Rails.root.join('config', 'schemas', 'picked_up_weapon_data.json_schema').to_s
  validates :data, json: { schema: JSON_SCHEMA }

  def self.build(params, round)
    weapon_data = params['picked_up']
    weapon = Item.where(name: weapon_data['name']).first_or_create(item_slot: weapon_data['type'],
                                                                       ammo_type: weapon_data['ammo'])
    user = User.find_by_steam_id(params['user_steam_id'])
    PickedUpWeapon.new(user: user,
                       round: round,
                       data: { item_id: weapon.id },
                       time: ApplicationRecord.epoch_to_datetime(params['time']))
  end
end
