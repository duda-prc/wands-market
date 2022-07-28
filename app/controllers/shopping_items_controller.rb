class ShoppingItemsController < ApplicationController
  before_action :set_wand, only: %i[create]
  before_action :shopping_item_params, only: %i[create]

  def create
    # Quantity of itens passed by the view
    quantity = shopping_item_params[:quantity].to_i
    @shopping_item = ShoppingItem.new(
      shopping_cart: @shopping_cart,
      wand: @wand,
      quantity: quantity
    )
    if quantity > @wand.quantity
      @shopping_item.quantity_greater_than_stock
      render 'wands/show'
    elsif @shopping_item.valid?
      if ShoppingItem.find_by(wand: @wand)
        @shopping_item = ShoppingItem.find_by(wand: @wand)
        @shopping_item.quantity += quantity
      end
      @wand.update(quantity: @wand.quantity - quantity)
      @shopping_item.save
      redirect_to @wand
    else
      render 'wands/show'
    end
  end

  def destroy
    @shopping_item = ShoppingItem.find(params[:id])
    @wand = @shopping_item.wand
    @wand.update(quantity: @wand.quantity + @shopping_item.quantity)
    @shopping_item.destroy
    redirect_to shopping_carts_path
  end

  private

  def set_wand
    @wand = Wand.find(params[:wand_id])
  end

  def shopping_item_params
    params.require(:shopping_item).permit(:quantity)
  end
end
