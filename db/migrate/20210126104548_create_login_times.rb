class CreateLoginTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :login_times do |t|
      t.reference :user
      t.date_time :time
    end
  end
end
