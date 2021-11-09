class BooksController < ApplicationController
  def index
    @newbook = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
    @book = @newbook
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully"
    else
      @newbook = Book.new
      @books = Book.all
      @user = User.find(current_user.id)
      render :index
    end
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    @currentuser = User.find(current_user.id)
    if @book.user == @currentuser
      render :edit
    else
      redirect_to books_path
    end

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully"
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
