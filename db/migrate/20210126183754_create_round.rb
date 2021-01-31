# frozen_string_literal: true

class CreateRound < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.boolean :innocent_win
      t.references :game_session
    end
  end
end
