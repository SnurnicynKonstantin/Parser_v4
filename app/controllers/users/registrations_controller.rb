class Users::RegistrationsController < Devise::RegistrationsController
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end