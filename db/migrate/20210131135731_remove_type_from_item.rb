class RemoveTypeFromItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :type, :string
  end
end
