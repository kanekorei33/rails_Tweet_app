class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path, notice: "つぶやきを編集しました！"
  end

  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end

  def create
    @post = Post.new(post_params)
    if params[:back]
       render :new
    else
      if @post.save
      redirect_to new_post_path, notice: "つぶやきを作成しました！"
      else
      render :new
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice:"つぶやきを削除しました！"
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
