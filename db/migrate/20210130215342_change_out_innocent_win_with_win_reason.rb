class ChangeOutInnocentWinWithWinReason < ActiveRecord::Migration[5.2]
  def change
    remove_column :rounds, :innocent_win, :boolean
    add_column :rounds, :win_reason, :string
  end
end
