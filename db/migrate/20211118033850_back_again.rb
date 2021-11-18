class BackAgain < ActiveRecord::Migration[6.1]
  def change
    change_column_null :schedules, :departure, true
    change_column_null :schedules, :destination, true
    change_column_null :schedules, :date_time, true
    change_column_null :users, :email, true
    remove_column :schedules, :booking_id
    add_column :bookings, :name, :string
    add_column :bookings, :email, :string
    add_reference :bookings, :schedule, foreign_key: true
    add_reference :users, :booking, foreign_key: true
  end
end
