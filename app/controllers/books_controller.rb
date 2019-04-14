class BooksController < ApplicationController
  before_action :correct_user, only: [:edit]

  def index
    @books = Book.page(params[:page]).reverse_order
    @book = Book.new
  end

  def show
    @books = Book.find(params[:id])
    @book = Book.new
    @user = User.find(@books.user_id)
    @comment = Comment.new
    @comments = @books.comments
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
      redirect_to book_path(book), notice: "Book was successfully created."
    else 
      flash[:notice] = "Error in create the book"
      redirect_to books_path
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book was successfully updated."
    else
      flash[:notice] = "Error in update the book"
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "Book was successfully destroyed."
  end

  private

    def book_params
      params.require(:book).permit(:title, :body)
    end

    def correct_user
      book = Book.find(params[:id])
      if current_user != book.user
        redirect_to user_path(current_user)
      end
    end
end