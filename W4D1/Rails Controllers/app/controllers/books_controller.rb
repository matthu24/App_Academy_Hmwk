class BooksController < ApplicationController

  def index
    # your code here
    # render text: "hello"
    # @books = Book.all
    render json: Book.all
  end

  def show
    book = Book.find_by(id: params[:id])
    render json: book
  end

  def new
    render :new
  end

  def create
    book = Book.new(book_params)
    if book.save
      render json: book
      # redirect_to books_url
    else
      render json: book.errors.full_messages, status: :unprocessable_entity
      # flash.now[:errors] = book.errors.full_messages
      # render :new
    end
  end

  def destroy
    # your code here

    book = Book.find_by(id: params[:id])

    book.destroy
    render json: book
      # redirect_to books_url
  end



  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
