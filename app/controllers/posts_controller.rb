class PostsController < ApplicationController
  before_action :find_post, except: [:new, :index, :create]


  def index
    if params[:q]
      @q = Post.search(params[:q])
      @post = @q.result.includes(:users, :comments).page(params[:page])
    else
      @post = Post.all.desc_order.page(params[:page])
    end
  end

  def show
    @post = Post.find(params[:id])
    Post.increment_counter(:view_count, @post.id)
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
    if @post.user == current_user
      @post.update_attributes(post_params)
      redirect_to @post
      flash[:success] = "Your drubbble post has been updated."
    else
      redirect_to @post
      flash[:error] = "Sorry, you cannot edit another user's post."
    end
  end

  def destroy
    @post.destroy
  end

  private

    def post_params
      params.require(:post).permit(:title, :userShot, :content, :tag_list)
    end

    def find_post
      @post = Post.find(params[:id])
    end

end
