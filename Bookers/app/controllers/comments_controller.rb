class CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = @book.id
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment = Comment.find_by(id: params[:id], book_id: params[:book_id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
