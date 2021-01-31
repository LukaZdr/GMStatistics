# frozen_string_literal: true

class CreateLoginTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :login_times do |t|
      t.references :user
      t.datetime :time
    end
  end
end
