class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # For sign up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :cell_no, :post_code, :door_no])

    # For account update
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :cell_no, :post_code, :door_no])
  end
end
