class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.new
    book = Book.find(params[:book_id])
    favorite.book_id = book.id
    favorite.save
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to book_path(book)
  end
end
