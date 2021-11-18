class DoMoreStuff < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :user_id
    remove_column :schedules, :user_id
    add_reference :users, :booking, foreign_key: true
    add_reference :schedules, :booking, foreign_key: true
  end
end
