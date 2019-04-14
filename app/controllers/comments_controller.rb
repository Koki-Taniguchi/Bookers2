class CommentsController < ApplicationController
  def create
    comment = current_user.comments.new(comment_params)
    book = Book.find(params[:book_id])
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
