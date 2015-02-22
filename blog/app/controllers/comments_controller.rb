class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]
	def new
		@comment = Comment.new
	end
	def create
		if(current_user)
			@comment = Comment.new(comment_params)
			@comment.user = current_user
			@post = Post.find(params[:post_id])
			@comment.post = @post
			if @comment.save
				redirect_to @post, notice: "Comment created successfully"
			else
            redirect_to @post, alert: @comment.errors.full_messages.join(". ")
			end
		else
			redirect_to posts_path(), notice: "You are not allowed to comment."
		end
  end

	private
    	def comment_params
      		params.require(:comment).permit(:body, :post)
    	end
end
