class AddSurvivedToRoundParticipant < ActiveRecord::Migration[5.2]
  def change
    add_column :round_participants, :survived, :boolean
  end
end
