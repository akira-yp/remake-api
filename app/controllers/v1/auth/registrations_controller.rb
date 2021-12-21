class V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(name designer email password))
    devise_parameter_sanitizer.permit(:account_update, keys: %i(name))
  end
end
