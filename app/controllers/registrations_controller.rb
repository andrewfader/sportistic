class RegistrationsController < Devise::RegistrationsController
  def after_sign_in_path_for(resource)
    edit_user_path(resource)
  end
end
