module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json

      # Override create to provide a custom JSON response
      def create
        # Call Devise's default behavior for user sign-up
        super do |resource|
          if resource.persisted?
            # Custom response after successful sign-up
            token = request.env['warden-jwt_auth.token']
            render json: {
              status: { code: 200, message: 'Signed up successfully.' },
              data: resource,
              token: token
            }, status: :ok and return
          end
        end

        # If resource is not persisted, handle the failure case
        if resource.errors.any?
          render json: {
            status: { message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" }
          }, status: :unprocessable_entity
        end
      end

      private

      # Strong parameters for sign-up (customize as needed)
      def sign_up_params
        params.require(:user).permit(:username, :email, :cell_no, :post_code, :door_no, :password, :password_confirmation)
      end
    end
  end
end
