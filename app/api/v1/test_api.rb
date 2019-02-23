module V1
  class TestAPI < Grape::API 
    version 'v1', using: :path
    format :json
    
    resources "tests" do
      desc "this is a test endpoint"

      get do
        { success: "from test api endpoint :)" }
      end
    end
  end
end