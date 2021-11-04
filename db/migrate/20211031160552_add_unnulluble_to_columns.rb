class AddUnnullubleToColumns < ActiveRecord::Migration[6.1]
  def change
    change_column_null :schedules, :id, false
    change_column_null :schedules, :station, false
    change_column_null :schedules, :destination, false
    change_column_null :schedules, :date_time, false
    change_column_null :schedules, :seats_available, false
    change_column_null :users, :id, false
    change_column_null :users, :email, false
    change_column_null :users, :firstname, false
    change_column_null :users, :lastname, false
    change_column_null :users, :password_digest, false
  end
end
