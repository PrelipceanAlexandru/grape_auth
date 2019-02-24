module V1
  class TestAPI < Grape::API 
    version 'v1', using: :path
    format :json
    auth :grape_devise_token_auth, resource_class: :user

    helpers do 
      include APIHelpers
    end

    resources "tests" do
      desc "this is a test endpoint"

      get do

        { success: "from test api endpoint :)" }
      end

      get "/private" do
        error!("Unauthorized", 401) unless authenticate_api_user

        { message: "hi #{current_api_user.email}"}
      end
    end
  end
end