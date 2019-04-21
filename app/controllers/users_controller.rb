
class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]

  def top
  end

  def about
  end

  def index
    @users = User.page(params[:page]).reverse_order
    @book = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
    @followers = Follow.where(follow_id: @user.id).page(params[:page]).reverse_order
    @follows = @user.follows.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "User was successfully updated."
    else
      flash[:notice] = "Error in update the user"
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end

    def correct_user
      user = User.find(params[:id])
      if current_user != user
        redirect_to user_path(current_user)
      end
    end
end
