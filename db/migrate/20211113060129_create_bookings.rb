class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :confirmation
      t.integer :seats
      t.integer :total_price
      t.references :users, null: false, foreign_key: true
      t.references :schedules, null: false, foreign_key: true

      t.timestamps
    end
  end
end
