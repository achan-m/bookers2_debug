class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_params)
    comment.book_id = book.id
    comment.save
    #以下2行と上の4行は同じ内容のところないのか？？？
    @book=Book.find(params[:book_id])
    @book_comment = BookComment.new
  end

  def destroy
    BookComment.find(params[:id]).destroy
    #上の文なんだ？ @book.destroyの文の意味も入ってるやつ？一文になってるのかな？→合ってました
    @book=Book.find(params[:book_id])
    @book_comment=BookComment.find_by(id: params[:id], book_id: params[:book_id])
    @book_comment.destroy
    @book_comment = BookComment.new
    #上の4行はなんだ？？？
  end

  private

  def book_params
    params.require(:book_comment).permit(:comment)
  end
end
