class UsersController < ApplicationController

  skip_before_action :login_required

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

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
