class ShoppingCartsController < ApplicationController

  def show_active
    authorize @shopping_cart
  end

  def show; end

  def index
    @shopping_cart = ShoppingCart.all
  end

  def buy
    @shopping_cart.active = false
    @shopping_cart = current_user.shopping_carts.create
  end
end
