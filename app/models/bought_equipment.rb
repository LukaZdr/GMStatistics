class BoughtEquipment < UserRoundAction
  JSON_SCHEMA = Rails.root.join('config', 'schemas', 'bought_equipment_data.json_schema').to_s
  validates :data, json: { schema: JSON_SCHEMA }
  
  def self.build(params, round)
    user = User.find_by_steam_id(params['user_steam_id'])
    create_user_ping_sample(params['ping'], user)
    item = Item.where(name: params['bought_equipment']).first_or_create
    BoughtEquipment.new(user: user,
                       round: round,
                       data: { item_id: item.id },
                       time: ApplicationRecord.epoch_to_datetime(params['time']))
  end
end
