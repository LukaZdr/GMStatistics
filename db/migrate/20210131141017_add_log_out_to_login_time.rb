class AddLogOutToLoginTime < ActiveRecord::Migration[5.2]
  def change
    remove_column :login_times, :time, :datetime
    add_column :login_times, :logout, :datetime
    add_column :login_times, :login, :datetime
    add_column :login_times, :logout_reason, :string
  end
end