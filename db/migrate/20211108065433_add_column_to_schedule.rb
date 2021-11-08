class AddColumnToSchedule < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :price, :integer
  end
end
