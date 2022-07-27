class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_shoppingcart
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_shoppingcart
    # Verificar se existe shopping cart ativo
    # Se existe -> recebe @shoppingcart (variavel acessível para todos os controllers)
    # Se não existe ShoppingCart.new
    @shoppingcart = nil
    return unless current_user

    @shoppingcart = current_user.shopping_carts.where(active: true).last
    @shoppingcart = current_user.shopping_carts.create if @shoppingcart.nil?
  end

  # Params added to the User params (devise)
  # Added first and last name to user
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
