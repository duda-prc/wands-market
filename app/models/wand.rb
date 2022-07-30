class Wand < ApplicationRecord
  CORE = %w[Unicorn Dragon Phoenix Troll].freeze
  WOOD = %w[Acacia Alder Apple Ash Aspen Beech Blackthorn Black Walnut Cedar Cherry Chestnut Cypress Dogwood Ebony Elder Elm Fir Hawtorn Hazel Holly Hornbeam Larch Laurel Maple Pine Reed Rowan Rosewood Walnut Yew].freeze
  MANUFACTURE = %w[Ollivander Gregorovitch Beauvais Jonker].freeze
  belongs_to :user
  has_many :shopping_items, dependent: :destroy

  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 1 }
end
