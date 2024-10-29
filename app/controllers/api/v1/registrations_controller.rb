# app/controllers/api/v1/registrations_controller.rb
class Api::V1::RegistrationsController < API::BaseController
  respond_to :json

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :cell_no, :post_code, :door_no, :password, :password_confirmation)
  end

  def respond_with(resource, _opts = {})
    if resource.persisted?
      token = request.env['warden-jwt_auth.token']
      render json: {
        status: { code: 200, message: 'Signed up successfully.' },
        data: resource,
        token: token
      }, status: :ok
    else
      render json: {
        status: { message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end
end
 