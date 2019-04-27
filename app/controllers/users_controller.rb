class UsersController < ApplicationController

  #ログインしているユーザーでなければurlを打ち込んでもlogin_pathに飛ばす
  skip_before_action :login_required,{except: [:edit, :show, :update]}

  #ログインユーザーでなければ編集できない
  before_action :ensure_correct_user,{only: [:show, :edit, :update]}

  def index
    @users=User.all.page(params[:page]).per(10)
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)

    if @user.save
      flash[:notice]="登録に成功しました。"
      redirect_to login_path
    else
      flash.now[:alert]="登録に失敗しました。"
      render :new
    end
  end

  def show
      @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])

    if @user.update(user_params)
      flash[:notice]="更新に成功しました。"
      redirect_to user_path
    else
      flash.now[:alert]="更新に失敗しました。"
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  #ログイン中のユーザしか編集できない処理
  def ensure_correct_user
    if current_user.id !=  params[:id].to_i
     flash[:alert]="権限をお確かめください。"
     redirect_to posts_path
    end
  end
end
