class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_shoppingcart

  def set_shoppingcart
    # Verificar se existe shopping cart ativo
    # Se existe -> recebe @shoppingcart (variavel acessível para todos os controllers)
    # Se não existe ShoppingCart.new
    @shoppingcart = nil
    return unless current_user

    @shoppingcart = current_user.shopping_carts.where(active: true).last
    @shoppingcart = current_user.shopping_carts.create if @shoppingcart.nil?
  end
end
