class CommentsController < ApplicationController

  def list
    @comments = Comment.all
  end

  def create
    puts params
      @blog = Blog.find(params[:blog_id])
      @comment = current_user.comments.new(comment_params)
      @comment.blog = @blog
      if @comment.save
        redirect_to "/blogs/#{@blog.id}"
      else
      redirect_to  "/"
      end

  end






  private
  def comment_params
      params.require(:comment).permit(:content, :blog_id, :user_id)
  end
end
