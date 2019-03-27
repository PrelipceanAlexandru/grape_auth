module V1
  class BooksAPI < Grape::API 
    version 'v1', using: :path
    format :json
    auth :grape_devise_token_auth, resource_class: :user

    helpers do 
      include APIHelpers
    end

    resources "books" do
      
      desc "create book"
      params do
        requires :name, type: String
        optional :price, type: Integer
      end

      post do
        book = Book.create(params)
        { book: book }
      end

      desc "get one book"

      get ":id" do
        { book: Book.find(params[:id]) }
      end

      desc "get all books"

      get do
        { books: Book.all }
      end

      desc "update book"
      params do
        optional :name, type: String
        optional :price, type: Integer
      end

      put ":id" do
        book = Book.find(params[:id])
        book.update(params)
        { new_book: book }
      end

      desc "delete book"
      params do
        requires :id, type: Integer
      end
      
      delete do
        book = Book.find(params[:id])
        book.destroy

        { success: 200 } 
      end

      get "/private" do
        error!("Unauthorized", 401) unless authenticate_api_user

        { message: "hi #{current_api_user.email}"}
      end
    end
  end
end