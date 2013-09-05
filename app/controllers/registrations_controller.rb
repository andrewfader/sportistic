class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def after_sign_in_path_for(user)
    edit_user_path(user)
  end

  def create
    sport_ids = params["user"].delete("user_sports_attributes")["sport_id"]
    build_resource(sign_up_params)
    sport_ids.map(&:presence).compact.map(&:to_i).uniq.each do |sport_id|
      sport = Sport.find(sport_id)
      resource.user_sports << UserSport.new(sport_id: sport_id, user_id: @user.id)
    end

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, :remember_me, :name, {user_sports_attributes: [:sport_id, :position]}, :state, :city, :privacy_toggle, :gender, :interests, :photo, :bio, :achievements, :distance_to_travel, :desire_to_join, :experience_level, :availability, :phone, photos_attributes: ['title', 'image', '_destroy'])

    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:email, :password, :current_password, :password_confirmation, :remember_me, :state, :name, {user_sports_attributes: [:sport_id, :position]}, :city, :privacy_toggle, :gender, :interests, :photo, :bio, :achievements, :distance_to_travel, :desire_to_join, :experience_level, :availability, :phone, photos_attributes: ['title', 'image', '_destroy'])
    end
  end
end
