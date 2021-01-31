# frozen_string_literal: true

class CreateItem < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :item_slot
      t.string :type, null: false
      t.string :ammo_type
    end
  end
end
