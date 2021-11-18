class Do < ActiveRecord::Migration[6.1]
  def change
    add_reference :schedules, :user, foreign_key: true
  end
end
