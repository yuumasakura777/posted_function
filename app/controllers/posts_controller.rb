class PostsController < ApplicationController

  before_action :set_post, only:[:edit, :update, :destroy]
  

  def index
    @posts=Post.all.order(created_at: :desc).page(params[:page]).per(30)
  end

  def new
    @post=Post.new
  end

  def create
    @post=current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      flash.now[:alert]="テキストを入力してください。"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post=current_user.posts.find(params[:id])
  end

end
