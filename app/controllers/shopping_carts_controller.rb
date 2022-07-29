class ShoppingCartsController < ApplicationController

  def show_active
    authorize @shopping_cart
  end

  def show; end

  def index; end


end
