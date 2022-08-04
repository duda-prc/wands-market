class WandsController < ApplicationController
  before_action :set_wand, only: %i[show edit update destroy]

  def new
    @wand = Wand.new
    authorize @wand
  end

  def create
    @wand = Wand.new(wand_params)
    # Helpers do devise (definição do usuário)
    authorize @wand

    @wand.user = current_user

    if @wand.save
      redirect_to my_wands_path
    else
      render :new
    end
  end

  def index
    # All wands that I did not create
    if params[:query].present?
      @wands = policy_scope(Wand).where.not(user: current_user).order(:name).global_search(params[:query])
    else
      @wands = policy_scope(Wand).where.not(user: current_user).order(:name)
    end
  end

  def show
    authorize @wand
    @shopping_item = ShoppingItem.new(
      shopping_cart: @shopping_cart,
      wand: @wand
    )
  end

  def edit
    authorize @wand
  end

  def update
    authorize @wand
    @wand.update(wand_params)
    redirect_to wand_path(@wand)
  end

  def destroy
    authorize @wand
    @wand.destroy!
    redirect_to my_wands_path
  end

  def mywands
    # Show all wands the user has created
    @wands = policy_scope(Wand).where(user: current_user).order(:name)
  end

  private

  def wand_params
    params.require(:wand).permit(:name, :wood, :core, :manufacture, :previous_owners, :quantity, :price, :available, :photo)
  end

  def set_wand
    @wand = Wand.find(params[:id])
  end
end
