class AllowMoreNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :schedules, :seats_available, true
  end
end
