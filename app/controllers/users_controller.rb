class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @books = Book.find(params[user_id])
    @books = @user.book
    @newbook = Book.new
  end

  def index
    @users = User.all
    @newbook = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
