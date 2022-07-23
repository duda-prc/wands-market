class ShoppingItemsController < ApplicationController
  before_action :set_wand, only: %i[create]

  def create
    quantity = params[:quantity].to_i
    @shopping_item = ShoppingItem.new(shopping_cart: @shoppingcart, wand: @wand, quantity: quantity)
    if quantity <= @wand.quantity && @shopping_item.save
      @wand.update(quantity: @wand.quantity - quantity)
      redirect_to wands_path
    else
      render :show
    end
  end

  private

  def set_wand
    @wand = Wand.find(params[:wand_id])
  end
end
