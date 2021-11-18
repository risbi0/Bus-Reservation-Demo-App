class DropTable < ActiveRecord::Migration[6.1]
  def change
    # not actually dropping table
    remove_column :users, :booking_id
  end
end
