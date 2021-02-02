# frozen_string_literal: true

class PickedUpWeapon < UserRoundAction
  def self.build(params, round)
    weapon_data = params['picked_up']
    weapon = Item.where(name: weapon_data['name']).first_or_create(item_slot: weapon_data['type'],
                                                                       ammo_type: weapon_data['ammo'])
    user = User.find_by_steam_id(params['user_steam_id'])
    PickedUpWeapon.new(user: user,
                        round: round,
                        data: { weapon_id: weapon.id },
                        time: ApplicationRecord.epoch_to_datetime(params['time']))
  end
end
