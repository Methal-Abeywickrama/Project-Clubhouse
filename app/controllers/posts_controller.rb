class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "Post was created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :author_id) # Adjust permitted attributes as needed
  end
end
