class CreatePingSample < ActiveRecord::Migration[5.2]
  def change
    create_table :ping_samples do |t|
      t.references :user, foreign_key: true
      t.integer :ping
      t.datetime :created_at, null: false
    end
  end
end
