class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = set_post
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

  end

  def edit
    @post = set_post
  end

  def update
    @post = set_post
    @post.update
    redirect_to post_path
  end

  def like
    @post = set_post
    @post.likes += 1
    @post.save()
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
