class BooksController < ApplicationController
  def index
    @newbook = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])

  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
