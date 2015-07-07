class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @post = Post.search(params[:search])
    else
      @post = Post.all
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash.now[:success] = "Your drubbble shot has been posted!"
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @post.update_attributes(post_params)
    flash.now[:success] = "Your drubbble post has been updated"
    redirect_to @post
  end

  def destroy
    @post.destroy
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end

    def find_post
      @post = Post.find(params[:id])
    end
end
