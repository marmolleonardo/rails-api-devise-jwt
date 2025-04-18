module Api
  module Users
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json
      skip_before_action :verify_authenticity_token
      
      def create
        build_resource(sign_up_params)

        if resource.save
          render json: {
            status: { code: 200, message: "Signed up successfully." },
            data: {
              user: {
                id: resource.id,
                email: resource.email,
                created_at: resource.created_at
              }
            }
          }, status: :ok
        else
          render json: {
            status: { 
              code: 422, 
              message: "User couldn't be created successfully.",
              errors: resource.errors.full_messages
            }
          }, status: :unprocessable_entity
        end
      end

      private

      def sign_up_params
        params.require(:user).permit(:email, :password)
      end

      def respond_with(resource, _opts = {})
        if request.method == "DELETE"
          render json: {
            status: { code: 200, message: "Account deleted successfully." }
          }, status: :ok
        end
      end
    end
  end
end
