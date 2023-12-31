class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def index
    @user = current_user
    @books = Book.all

  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book updated is successfully."
      redirect_to book_path(@book.id)
    else
      flash[:alert] = "update error. title and body can't be blank. opinion can be up to 200 characters."
      render action: :edit
    end

  end



  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Create book is successfully."
      redirect_to book_path(@book)
    else
      flash[:alert] = "error. title and body can't be blank. opinion can be up to 200 characters."
      redirect_to '/books'
    end

  end


  private
  def book_params
    params.require(:book).permit(:title, :body)

  end

  # 不具合箇所
  def is_matching_login_user
    user = Book.find(params[:id])
    unless user.user_id == current_user.id
      redirect_to books_path
    end
  end


end
