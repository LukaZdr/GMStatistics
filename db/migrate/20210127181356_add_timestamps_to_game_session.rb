class AddTimestampsToGameSession < ActiveRecord::Migration[5.2]
  def change
    add_column :game_sessions, :created_at, :datetime, null: false
    add_column :game_sessions, :updated_at, :datetime, null: false
  end
end
