# frozen_string_literal: true

class CreateRoundParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :round_participants do |t|
      t.references :round, foreign_key: true
      t.references :user, foreign_key: true
      t.string :role
      t.integer :karma
      t.integer :score
    end
  end
end
