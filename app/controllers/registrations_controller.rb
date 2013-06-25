class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def after_sign_in_path_for(user)
    edit_user_path(user)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, :remember_me, :fullname, :sports, :city, :privacy_toggle, :gender, :interests, :photo, :bio, :achievements, :distance_to_travel, :desire_to_join, :experience_level, :position, :availability, :phone, photos_attributes: ['title', 'image', '_destroy'])

    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:email, :password, :current_password, :password_confirmation, :remember_me, :fullname, :sports, :city, :privacy_toggle, :gender, :interests, :photo, :bio, :achievements, :distance_to_travel, :desire_to_join, :experience_level, :position, :availability, :phone, photos_attributes: ['title', 'image', '_destroy'])
    end
  end
end
