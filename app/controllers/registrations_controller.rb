class RegistrationsController < Devise::RegistrationsController
  def after_sign_in_path_for(user)
    edit_user_path(user)
  end
end
