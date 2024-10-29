# app/controllers/api/base_controller.rb

module API
  class BaseController < ActionController::API
    include ActionController::Cookies
    include ActionController::Helpers
    include ActionController::Flash

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :cell_no, :post_code, :door_no])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :cell_no, :post_code, :door_no])
    end
  end
end


