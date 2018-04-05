class PostsController < ApplicationController
	  before_action :find_post, only: [:edit, :update, :show, :delete]
#render all posts
	def index
		@posts = Post.all
	end

#action for creating posts
	def new
		@post = Post.new
	end

#action for saving post to db
	def create
		@post = Post.new
		if @post.save(post_params)
			flash[:notice] = "Post Created!"
			redirect_to post_path(@post)
		else
			flash[:alert] = "Something is wrong!"
			render :edit
		end
	end

#updates post with new info
	def update
		if @post.update_attributes(post_params)
			flash[:notice] = "Solid Update!"
			redirect_to post_path(@posts)
		else
			flash[:alert] = "Try Again!"
			render :edit
		end
	end

#renders individual posts after getting the ID
	def show
	end

#deletes post from db
	def destroy
		if @post.destroy
			flash[:notice] = "It's gone"
			redirect_to posts_path
		else
			flash[:alert] = "Try Again!"
		end
	end

private


	def post_params
		params.require(:post).permit(:title, :body)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end




