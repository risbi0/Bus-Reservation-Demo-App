class CombineFirstAndLastName < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :firstname
    remove_column :users, :lastname
    add_column :users, :name, :string
  end
end
