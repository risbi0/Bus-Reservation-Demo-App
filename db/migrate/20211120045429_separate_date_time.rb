class SeparateDateTime < ActiveRecord::Migration[6.1]
  def change
    remove_column :schedules, :date_time
    add_column :schedules, :date, :date
    add_column :schedules, :time, :time
  end
end
