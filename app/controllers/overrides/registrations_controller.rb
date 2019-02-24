module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    before_action :as_superadmin, only: [:create]

    def create
      super do |resource|

      end
    end

    def as_superadmin
      error = "You are not superadmin"

      unless current_api_user&.email == "test@test.com"
        render json: {error: error}
      end
    end
  end
end