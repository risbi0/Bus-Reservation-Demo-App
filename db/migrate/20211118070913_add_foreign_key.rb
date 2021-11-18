class AddForeignKey < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :user, foreign_key: true
  end
end
