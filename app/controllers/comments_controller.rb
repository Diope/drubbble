class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
    @comment = @post.comments.new
  end

  def create
    @post = find_post
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    if @comment.save
      redirect_to @post
    else
      redirect_to @post
      flash[:error] = "You cannot submit blank data"
    end
  end

  def edit
    @post = find_post
    @comment = @post.comments.find(params[:id])
  end

  def update
      @post = find_post
      @comment = @post.comments.find(params[:id])
      if @comment.user_id == current_user.id
        @comment.update_attributes(comment_params)
          redirect_to @post
      else
        redirect_to @post
        flash[:alert] = "You are not the correct user"
    end
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def find_post
      @post = Post.find(params[:post_id])
    end

end
