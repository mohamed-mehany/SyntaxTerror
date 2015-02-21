class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]
  def index
    if params[:category]
      @posts = Post.cat_with(params[:category]).page params[:page]
    else
      @posts = Post.all.order('created_at DESC').page params[:page]
    end
  end
  def show
    @post = Post.find(params[:id])
  end
  def new
    @post = Post.new
  end
  def create
    if(current_user && current_user.auth)
      @post = Post.new(post_params)
      @post.user = current_user

      if @post.save
        redirect_to @post, notice: "Post created successfully"
      else
        render 'new'
      end
    else
      redirect_to root_path(), notice: "You are not allowed to post."
    end

  end
  def edit
    @post = Post.find(params[:id])
    render 'new'
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated successfully"
    else
      render 'new'
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :cat_list)
    end
end
