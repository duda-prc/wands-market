class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_shoppingcart
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit::Authorization

  # Pundit: white-list approach.
  after_action :verify_authorized, except: %i[index mywands], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: %i[index mywands], unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def set_shoppingcart
    # Verificar se existe shopping cart ativo
    # Se existe -> recebe @shoppingcart (variavel acessível para todos os controllers)
    # Se não existe ShoppingCart.new
    @shopping_cart = nil
    return unless current_user

    @shopping_cart = current_user.shopping_carts.where(active: true).last
    @shopping_cart = current_user.shopping_carts.create if @shopping_cart.nil?
  end

  # Params added to the User params (devise)
  # Added first and last name to user
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name photo])
  end
end
