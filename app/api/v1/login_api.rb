module V1
  class TestAPI < Grape::API 
    version 'v1', using: :path
    format :json
    auth :grape_devise_token_auth, resource_class: :user
    helpers GrapeDeviseTokenAuth::AuthHelpers
    
    resources "users" do
      # desc "login"
      # post "auth" do
      #   debugger
      # end
    end
  end
end