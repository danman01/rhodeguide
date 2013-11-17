class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  # Override after sign in to point user to creating a new group
  def after_sign_in_path_for(resource)
    if user_signed_in? && current_user.groups.empty?
      new_group_path
    else
      root_url
    end
  end

  protected

  def configure_permitted_parameters
    # add custom devise params here
    # devise_parameter_sanitizer.for(:sign_up) << :username
  end

end
