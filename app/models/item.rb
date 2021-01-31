class Item < ApplicationRecord
  ITEM_SLOT_RANGE = { -1, 0, 1, 2, 3, 4, 5, 6, 7}

  validates :name, presence: true
  validates :item_slot, inclusion: { in: ITEM_SLOT_RANGE }, allow_nil: true

  def is_weapon?
    item_slot.present?
  end

  def is_passive?
    item_slot.blank?
  end
end