class ShoppingCart < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :shopping_items
end
