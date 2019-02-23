require "grape-swagger"

module V1
  class Root < Grape::API
    format :json

     mount ::V1::TestAPI

     add_swagger_documentation(
        api_version: "v1",
        hide_documentation_path: true,
        mount_path: "v1/swagger_doc",
        hide_format: true
      )
   end
end