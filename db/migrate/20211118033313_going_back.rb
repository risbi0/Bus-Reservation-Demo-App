class GoingBack < ActiveRecord::Migration[6.1]
  def change
    remove_column :schedules, :booking_id
    add_reference :schedules, :booking, foreign_key: true
  end
end
