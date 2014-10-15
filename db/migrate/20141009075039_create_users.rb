class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :phone, null: false
      t.integer :pin, null: false

      t.timestamps
    end

    add_index :users, :phone, unique: true
  end
end
