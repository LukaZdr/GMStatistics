# frozen_string_literal: true

class AddCreditsToRoundParticipant < ActiveRecord::Migration[5.2]
  def change
    add_column :round_participants, :credits, :integer
  end
end
