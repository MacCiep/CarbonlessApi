class ApplicationController < ActionController::API
  include Paginable

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :prepare_pagination, only: %i[index]
  respond_to :json

  def configure_permitted_parameters
    added_attrs = %i[name lastname email encrypted_password password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
