class AddMoreColumnsToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :email, :string
    add_column :bookings, :schedules_id, :integer
  end
end
