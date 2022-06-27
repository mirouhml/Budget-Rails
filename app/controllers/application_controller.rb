class ApplicationController < ActionController::Base
  load_and_authorize_resource
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_back fallback_location: root_path, notice: exception.message }
      format.js { head :forbidden, content_type: 'text/html' }
    end
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
