class PostsController < ApplicationController

  before_action :authenticate_author!, only: [:new , :create]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/:id
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create 
    @post = current_author.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: "Post was created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content) # Adjust permitted attributes as needed
  end
end
