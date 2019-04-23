class ApplicationController < ActionController::Base

  helper_method :current_user
  before_action :login_required

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404

  def render_404
    flash.now[:alert]="エラーページです。"
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'

  end

  private

  def current_user
    @current_user=User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    unless current_user
      flash[:alert]="ログインしてください。"
      redirect_to login_path
    end
  end

end
