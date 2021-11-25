class AddMoreColumnsToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :selected_seats, :string
  end
end
