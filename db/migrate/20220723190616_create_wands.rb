class CreateWands < ActiveRecord::Migration[6.1]
  def change
    create_table :wands do |t|
      t.string :name
      t.string :manufacture
      t.string :wood
      t.string :core
      t.string :previous_owners
      t.references :users, null: false, foreign_key: true
      t.integer :quantity
      t.float :price
      t.boolean :available

      t.timestamps
    end
  end
end
