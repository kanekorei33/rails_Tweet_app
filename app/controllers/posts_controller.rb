class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "つぶやきを編集しました！"
    end
  end

  def confirm
  end

  def create
    @post = Post.new(post_params)
    if @post.save
    redirect_to new_post_path, notice: "つぶやきを作成しました！"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
end
