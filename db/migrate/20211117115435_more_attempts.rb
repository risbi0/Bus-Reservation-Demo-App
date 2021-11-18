class MoreAttempts < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :schedules_id
    remove_column :bookings, :name
    remove_column :bookings, :email
    remove_column :bookings, :departure
    remove_column :bookings, :destination
    remove_column :bookings, :base_price
    remove_column :bookings, :date_time
  end
end
