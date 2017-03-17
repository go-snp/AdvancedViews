class CommentsController < ApplicationController
  before_action :set_blog_and_entry, only: [:create, :destroy, :approve]

  def create
    @comment = @entry.comments.new(comment_params)
    @comment.status = "unapproved"

    @comment.save
    redirect_to blog_entry_path(@blog, @entry)

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to blog_entry_path(@blog, @entry)
  end

  def approve
    @comment = Comment.find(params[:comment_id])
    @comment.update(status: "approved")
    redirect_to blog_entry_path(@blog, @entry)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_blog_and_entry
      @blog = Blog.find(params[:blog_id])
      @entry = Entry.find_by(id: params[:entry_id], blog_id: params[:blog_id])
    end

end
