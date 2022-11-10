class BookCommentsController < ApplicationController
  def create
    @book=Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_params)
    comment.book_id = @book.id
    comment.save
    @book_comment = BookComment.new
  end

  def destroy
    @bookcomment=BookComment.find(params[:id])
    @bookcomment.destroy
    #BookComment.find(params[:id]).destroyが略の形
    @book=Book.find(params[:book_id])
    @book_comment = BookComment.new
  end

  private

  def book_params
    params.require(:book_comment).permit(:comment)
  end
end
