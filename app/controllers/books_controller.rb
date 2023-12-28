class BooksController < ApplicationController
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
    @book.update(book_params)
    redirect_to book_path(@book.id)

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
       flash[:alert] = "error. Book was not created. Title and body can't be blank.Opinion can be up to 200 characters."
      redirect_to '/books'
    end

  end


  private
  def book_params
    params.require(:book).permit(:title, :body)

  end



end
