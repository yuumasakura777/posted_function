class ImgpostsController < ApplicationController

  def index
    @imgposts=Imgpost.all.order(created_at: :desc).page(params[:page]).per(9)
  end

  def new
    @imgpost=Imgpost.new
  end

  def create
    @imgpost=current_user.imgposts.new(imgpost_params)

    if @imgpost.save
      redirect_to imgposts_path
    else
      flash.now[:alert]="画像の投稿に失敗しました。"
      render :new
    end
  end

  def destroy
    @imgpost=current_user.imgposts.find(params[:id])

    @imgpost.destroy
    flash[:notice]="画像名:#{@imgpost.name}を削除しました。"
    redirect_to imgposts_path
  end

  private

  def imgpost_params
    params.require(:imgpost).permit(:name, :img)
  end

end
