class AddAuthenticatedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authenticated, :boolean, null: false, default: false
    add_index  :users, :authenticated
  end
end
