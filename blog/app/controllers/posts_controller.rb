class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
  def index
    if params[:category]
      @posts = Post.cat_with(params[:category])
    else
      @posts = Post.all.order('created_at DESC')
    end
  end
  def show
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :cat_list)
    end
end
