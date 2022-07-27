class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shopping_carts
  has_many :wands

  validates :first_name, presence: true
  validates :last_name, presence: true

  # Warden::Manager.after_set_user do |user, auth, opts|
  #   if (opts[:scope] == :user && opts[:event] == :set_user)
  #     shoppingcart = shopping_carts.where(active: true).last
  #     ShoppingCart.new(user: self) if shoppingcart.nil?
  #   end
  # end
end
