class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully. profile updated."
      redirect_to user_path(@user.id)
    else
      flash[:alert] = "error.Name is too short (minimum is 2 characters). introduction is maximum 50 characters."
      render action: :edit
    end

  end
  def new
    @book = Book.new
  end

  def index
    @user = current_user
    @users = User.all
  end
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)

  end
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_path
    end
  end


end
