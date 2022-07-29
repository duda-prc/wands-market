class ShoppingItemsController < ApplicationController
  before_action :set_wand, only: %i[create]
  before_action :shopping_item_params, only: %i[create]

  def create
    # Quantity of itens passed by the view
    quantity = shopping_item_params[:quantity].to_i
    # Creating a new shopping item
    @shopping_item = ShoppingItem.new(
      shopping_cart: @shopping_cart,
      wand: @wand,
      quantity: quantity
    )

    authorize @shopping_item
    # Verify if quantity is in stock
    if quantity > @wand.quantity
      # Method inside ShoppingItem model
      # Adds error message: Quantity is not available in stock
      @shopping_item.quantity_greater_than_stock
      render 'wands/show'
    elsif @shopping_item.valid? && @wand.available
      if ShoppingItem.find_by(wand: @wand)
        @shopping_item = ShoppingItem.find_by(wand: @wand)
        @shopping_item.quantity += quantity
      end
      @wand.update(quantity: @wand.quantity - quantity)
      @wand.update(available: false) if @wand.quantity.zero?
      @shopping_item.save
      redirect_to @wand
    else
      render 'wands/show'
    end
  end

  def destroy
    @shopping_item = ShoppingItem.find(params[:id])
    authorize @shopping_item
    @wand = @shopping_item.wand
    @wand.update(quantity: @wand.quantity + @shopping_item.quantity)
    @shopping_item.destroy
    redirect_to shoppingcart_path
  end

  private

  def set_wand
    @wand = Wand.find(params[:wand_id])
  end

  def shopping_item_params
    params.require(:shopping_item).permit(:quantity)
  end
end
