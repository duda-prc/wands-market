class ShoppingItem < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :wand, dependent: :destroy
end
