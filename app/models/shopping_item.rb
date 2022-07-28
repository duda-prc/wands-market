class ShoppingItem < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :wand

  validates :quantity, numericality: { greater_than_or_equal_to: 1 }

  def quantity_greater_than_stock
    errors.add(:quantity, 'is not available in stock')
  end
end
