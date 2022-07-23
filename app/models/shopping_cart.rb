class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :shopping_items
end
