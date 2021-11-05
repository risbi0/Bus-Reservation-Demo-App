class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :schedules, :station, :departure
  end
end
