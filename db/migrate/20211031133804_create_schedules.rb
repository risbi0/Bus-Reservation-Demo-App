class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :station
      t.string :destination
      t.datetime :date_time
      t.integer :seats_available

      t.timestamps
    end
  end
end
