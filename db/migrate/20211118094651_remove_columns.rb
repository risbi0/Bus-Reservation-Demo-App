class RemoveColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :name
    remove_column :bookings, :email
  end
end
