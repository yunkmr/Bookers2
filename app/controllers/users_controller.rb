class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @newbook = Book.new
  end

  def index
    @users = User.all
    @user = User.find(current_user.id)
    @newbook = Book.new
  end

  def edit
    @user = User.find(params[:id])
    @currentuser = User.find(current_user.id)
    if @user == @currentuser
      render :edit
    else
      redirect_to user_path(@currentuser.id)
    end

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
