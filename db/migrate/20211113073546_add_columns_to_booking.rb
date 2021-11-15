class AddColumnsToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :name, :string
    add_column :bookings, :departure, :string
    add_column :bookings, :destination, :string
    add_column :bookings, :date_time, :datetime
  end
end
