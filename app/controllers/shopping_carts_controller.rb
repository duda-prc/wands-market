class ShoppingCartsController < ApplicationController

  def show_active
    authorize @shopping_cart
  end

  def show; end

  def index
    @shopping_carts = policy_scope(ShoppingCart)
  end

  def buy
    authorize @shopping_cart
    return unless @shopping_cart.shopping_items

    @shopping_cart.update(active: false)
    @shopping_cart = current_user.shopping_carts.create
    redirect_to shoppingcart_path
  end
end
