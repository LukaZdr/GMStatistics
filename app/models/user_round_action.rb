# frozen_string_literal: true

class UserRoundAction < ApplicationRecord
  # all action types should be written so that its clear witch user is ment. user ... {action_type}
  ACTION_TYPES = {
    'picked_up_weapon' => PickedUpWeapon,
    'bought_equipment'=> nil,
    'searched_corpse'=> nil,
    'found_dna'=> nil,
    'took_damage'=> nil,
    'revived_player'=> nil,
    'died'=> nil }.freeze

  belongs_to :user
  belongs_to :round

  validates :type, presence: true
  validates :time, :data, presence: true
end