class RemoveForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :booking_id
  end
end
