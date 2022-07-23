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
      redirect_to @wand
    else
      render :new
    end
  end

  def index
    @wands = Wand.all
  end

  def show; end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def wand_params
    params.require(:wand).permit(:name, :wood, :core, :manufacture, :previous_owners, :quantity, :price, :available)
  end

  def set_wand
    @wand = Wand.find(params[:id])
  end
end
