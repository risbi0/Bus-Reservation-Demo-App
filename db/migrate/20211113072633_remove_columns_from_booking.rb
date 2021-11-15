class RemoveColumnsFromBooking < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :schedules_id
    remove_column :bookings, :users_id
  end
end
