class CreateShoppingItems < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_items do |t|
      t.references :shopping_cart, null: false, foreign_key: true
      t.references :wand, null: false, foreign_key: true
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
