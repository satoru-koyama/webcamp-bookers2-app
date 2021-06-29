class BooksController < ApplicationController

  # 変数を一か所にまとめたいときはbefore_actionを使って、指定したアクションを先に呼び出して、変数を宣言できる。
  # before_actionで呼び出されるアクションで宣言した変数は、その後に呼び出されるアクション先のビュ―ファイルでも使用できる。
  before_action :book_all

  # 同じく変数をまとめられる記述であるがメジャーな書き方じゃない。
  # bootstrapが適用されなかった。
  # attr_reader :books
  # def initialize
  #   @books = Book.all
  # end

  def index
    @book1 = Book.new
    @user = current_user
    # @book = Book.new
  end

  def create
    @book1 = Book.new(book_params)
    @book1.user_id = current_user.id
    if @book1.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book1)
    else
      @user = current_user
      # @book = Book.new
      # @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user.id == current_user.id
      render :edit
    else
      redirect_to books_path
    end
  end

  def show
    # @book = Book.new
    @book1 = Book.find(params[:id])
    @user = @book1.user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  # private以下のメソッドはクラス内のどのメソッドからも呼び出すことができる
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  # book_allにはまとめたい変数を記述する
  def book_all
    @books = Book.all
    @book = Book.new
  end

end
