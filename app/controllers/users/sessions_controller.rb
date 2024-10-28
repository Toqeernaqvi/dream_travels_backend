# app/controllers/users/sessions_controller.rb

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    token = request.env['warden-jwt_auth.token']
    render json: {
      status: { code: 200, message: 'Logged in successfully.' },
      data: resource,
      token: token
    }, status: :ok
  end

  def respond_to_on_destroy
    render json: { status: { message: 'Logged out successfully.' } }, status: :ok
  end
end
