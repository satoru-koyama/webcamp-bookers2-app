class BooksController < ApplicationController
  def index

  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book)
  end

  def edit
  end

  def show
    @user = current_user
    @book = Book.new
    @book1 = Book.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
