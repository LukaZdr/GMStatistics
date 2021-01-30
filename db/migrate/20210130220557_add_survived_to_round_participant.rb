class AddSurvivedToRoundParticipant < ActiveRecord::Migration[5.2]
  def change
    add_column :round_participants, :survivied, :boolean
  end
end
