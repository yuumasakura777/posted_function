class SessionsController < ApplicationController

  skip_before_action :login_required
  def new
  end

  def create
    user=User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id]=user.id
      flash[:notice]="#{user.name}さん、ログインに成功しました。"
      redirect_to posts_path
    else
      flash.now[:alert]="ログインに失敗しました。"
      render :new
    end
  end

  def destroy
    reset_session
    flash[:notice]="ログアウトしました。"
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
