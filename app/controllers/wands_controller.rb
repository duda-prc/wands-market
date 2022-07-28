class WandsController < ApplicationController
  before_action :set_wand, only: %i[show edit update destroy]

  def new
    @wand = Wand.new
  end

  def create
    @wand = Wand.new(wand_params)
    # Helpers do devise (definição do usuário)

    @wand.user = current_user

    if @wand.save
      redirect_to my_wands_path
    else
      render :new
    end
  end

  def index
    # All wands that I did not create
    @wands = Wand.where.not(user: current_user)
  end

  def show
    @shopping_item = ShoppingItem.new(
      shopping_cart: @shopping_cart,
      wand: @wand
    )
  end

  def edit; end

  def update
    @wand.update(wand_params)
    redirect_to wand_path(@wand)
  end

  def destroy
    @wand.destroy!
    redirect_to my_wands_path
  end

  def mywands
    # All wands I have created
    @wands = Wand.where(user: current_user)
  end

  private

  def wand_params
    params.require(:wand).permit(:name, :wood, :core, :manufacture, :previous_owners, :quantity, :price, :available)
  end

  def set_wand
    @wand = Wand.find(params[:id])
  end
end
