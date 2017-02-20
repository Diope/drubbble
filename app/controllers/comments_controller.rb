class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def new
    @post = Post.new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @post }
        format.js
      end
    else
      redirect_to @post
      flash[:error] = "You cannot submit an empty post"
    end
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
      @comment = @post.comments.find(params[:id])
      if @comment.user_id == current_user.id
        @comment.update_attributes(comment_params)
          redirect_to @post
      else
        redirect_to @post
        flash[:alert] = "Sorry but you are not the correct user"
      end
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

end
