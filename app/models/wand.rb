class Wand < ApplicationRecord
  belongs_to :users
  has_many :shopping_items
end
