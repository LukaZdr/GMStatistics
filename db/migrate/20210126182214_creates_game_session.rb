# frozen_string_literal: true

class CreatesGameSession < ActiveRecord::Migration[5.2]
  def change
    create_table :game_sessions do |t|
      t.references :map
    end
  end
end
