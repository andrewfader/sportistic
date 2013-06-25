class InvitationsController < Devise::InvitationsController
  prepend_before_filter :check_for_existing_user, only: [:edit, :update, :destroy]
  before_filter :configure_permitted_parameters

  def after_accept_path_for(user)
    team_path(Team.associate(user, user.invited_by_id))
  end

  private

  def check_for_existing_user
    assert_is_devise_resource!
    return unless is_navigational_format?
    no_input = devise_mapping.no_input_strategies

    authenticated = if no_input.present?
                      args = no_input.dup.push :scope => resource_name
                      warden.authenticate?(*args)
                    else
                      warden.authenticated?(resource_name)
                    end

    if authenticated && resource = warden.user(resource_name)
      redirect_to team_path(Team.associate(resource, User.find(resource_class.to_adapter.find_first(params.slice(:invitation_token))).invited_by_id))
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:accept_invitation) do |u|
      u.permit(:name, :email, :invitation_token, :name, :gender, :city, :sports)
    end
  end
end
