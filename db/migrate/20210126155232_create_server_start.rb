# frozen_string_literal: true

class CreateServerStart < ActiveRecord::Migration[5.2]
  def change
    create_table :server_starts do |t|
      t.datetime :time
    end
  end
end
