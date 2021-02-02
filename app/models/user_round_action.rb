# frozen_string_literal: true

class UserRoundAction < ApplicationRecord
  self.abstract_class = true
  # all action types should be written so that its clear witch user is ment. user ... {action_type}
  ACTION_TYPES = { 'picked_up_weapon', 'bought_equipment', 'searched_corpse', 'found_dna', 'took_damage', 'revived_player', 'died' }

  belongs_to :user
  belongs_to :round

  validates :type, presence: true, inclusion: { in: ACTION_TYPES }
  validates :time, :data, presence: true
end