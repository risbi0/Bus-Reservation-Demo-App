class AddColumnToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :base_price, :integer
  end
end
