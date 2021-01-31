# frozen_string_literal: true

class CreateMap < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.string :name
    end
  end
end
