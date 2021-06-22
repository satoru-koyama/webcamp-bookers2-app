class BooksController < ApplicationController
  def index
    @book1 = Book.new
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def create
    @book1 = Book.new(book_params)
    @book1.user_id = current_user.id
    if @book1.save
      flash[:book_create] = "You have created book successfully."
      redirect_to book_path(@book1)
    else
      @user = current_user
      @book = Book.new
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @user = current_user
    @book = Book.new
    @book1 = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
