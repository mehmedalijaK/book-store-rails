class Api::V1::BooksController < ApplicationController
  before_action :authorize_request, except: :index
  before_action :check_admin, except: [:index, :show]

  def index
    books = Book.all
    render json: get_books_json(books), status: 200
  end

  def get_books_json(books)
    books.as_json(
      only: [:id, :name, :description, :price, :created_at, :updated_at],
      include: {
        category: {
          only: [:id, :name, :created_at, :updated_at]
        },
        authors: {
          only: [:id, :name, :created_at, :updated_at]
        }
      }
    )
  end

  def show
    book = Book.find_by(id: params[:id])
    if book
      render json: get_books_json(book), status: 200
    else
      render json: {error: "Book not found."}, status: 404
    end
  end

  def create
    book = Book.new(
      name: book_params[:name],
      description: book_params[:description],
      price: book_params[:price],
      category_id: book_params[:category_id]
    )

    if book.save
      author_ids = book_params[:author_ids]
      if author_ids.present? && author_ids.is_a?(Array)
        author_ids.each do |author_id|
          book_author = BookAuthor.create(book_id: book.id, author_id: author_id)
          unless book_author.persisted?
            render json: { error: "Error creating BookAuthor record for author_id #{author_id}" }, status: 422
            return
          end
        end
      end

      render json: get_books_json(book), status: 200
    else
      render json: { error: "Error creating book!" }, status: 422
    end
  end

  def update
    book = Book.find_by(id: params[:id])

    if book
      if book.update(book_params)
        render json: book, status: 200
      else
        render json: { error: "Error updating book!" }, status: 422
      end
    else
      render json: { error: "Book not found." }, status: 404
    end
  end

  def destroy
    book = Book.find_by(id: params[:id])
    book

    if book
      book.destroy
      render json: {message: "Book deleted successfully."}, status: 200
    else
      render json: {error: "Book not found."}, status: 404
    end
  end

  private
    def book_params
      params.require(:book).permit(
        :name,
        :description,
        :price,
        :category_id,
        author_ids: []
      )
    end
end
