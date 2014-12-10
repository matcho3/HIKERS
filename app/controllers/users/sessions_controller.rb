class Users::SessionsController < Devise::SessionsController
  # before_action :configure_permitted_parameters, only: [:create]
  def new
    super
  end
  def create
    super
  end

  def destroy
    super
  end

  # protected
  #   def configure_permitted_parameters
  #     devise_parameter_sanitizer.for(:sign_in) << :name
  #   end
end