class PostsController < ApplicationController
  def index
    @posts=Post.all
  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def confirm
  end

  def create
    Post.create(content: params[:post][:content])
  end
end
