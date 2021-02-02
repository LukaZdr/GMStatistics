class CreateUserRoundAction < ActiveRecord::Migration[5.2]
  def change
    create_table :user_round_actions do |t|
      t.references :user, foreign_key: true
      t.references :round, foreign_key: true
      t.string :type
      t.datetime :time
      t.jsonb :data
    end
  end
end
