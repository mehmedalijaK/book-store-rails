class Api::V1::AuthorsController < ApplicationController
  before_action :authorize_request, except: :index
  before_action :check_admin, except: [:index, :show]

  def index
    authors = Author.all
    render json: authors, status: 200
  end

  def show
    author = Author.find_by(id: params[:id])
    if author
      render json: author, status: 200
    else
      render json: {error: "Author not found."}, status: 404
    end
  end

  def create
    author = Author.new(
      name: author_params[:name],
    )
    if author.save
      render json: author, status: 200
    else
      render json: {error: "Error creating author!"}, status: 422
    end
  end

  def update
    author = Author.find_by(id: params[:id])

    if author
      if author.update(author_params)
        render json: author, status: 200
      else
        render json: {error: "Error updating author!"}, status: 422
      end
    else
      render json: {error: "Author not found."}, status: 404
    end
  end

  def destroy
    author = Author.find_by(id: params[:id])

    if author
      author.destroy
      render json: {message: "Author deleted successfully."}, status: 200
    else
      render json: {error: "Author not found."}, status: 404
    end
  end

  private
    def author_params
      params.require(:author).permit([
        :name,
      ])
    end

end
