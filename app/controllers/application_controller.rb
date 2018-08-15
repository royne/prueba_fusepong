class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:document, :name])
  end

  # renderiza la vista segun role
  def after_sign_in_path_for(resource)
    if current_user.has_role? :message
      message_path(current_user.id)
    else
      root_path
    end
  end

end
