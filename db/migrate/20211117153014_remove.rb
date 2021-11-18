class Remove < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :schedule_id
  end
end
