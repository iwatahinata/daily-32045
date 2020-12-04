class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname, :type_id])
  end

  def cuurent_cart
   @cuurent_cart = Cart.find_by(id: session[:cart_id])
   @cuurent_cart = Cart.create unless @current_cart
   session[:cart_id] = @current_cart.id
   @current_cart
  end
end
