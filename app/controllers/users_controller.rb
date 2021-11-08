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
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # flash[:notice] = "Book was successfully created."
      redirect_to user_path(@user.id), notice: "You have updated user successfully"
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
