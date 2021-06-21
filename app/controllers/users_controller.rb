class UsersController < ApplicationController
  def index
  end
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = current_user.books
  end
  def edit
  end
  def update
  end

  private
  def user_params
    params.require(:user).permit(:profile_image, :introduction)
  end

end
