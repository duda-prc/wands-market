class CreateShoppingCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_carts do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
