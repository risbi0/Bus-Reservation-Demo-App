class RemoveAndAddColumnToBooking < ActiveRecord::Migration[6.1]
  def change
    remove_column :schedules, :base_price
    add_column :bookings, :base_price, :integer
  end
end
