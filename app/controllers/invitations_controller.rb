class InvitationsController < Devise::InvitationsController
  prepend_before_filter :check_for_existing_user, only: [:edit, :update, :destroy]
  before_filter :configure_permitted_parameters

  def after_accept_path_for(user)
    team_path(Team.associate(user, user.invited_by_id))
  end

  def new
    @team_id = params[:team_id]
    super
  end

  def create
    if params[:user_id]
      self.resource = User.find(params[:user_id])
      self.resource.invited_to_id = params[:invited_to_id]
      self.resource.save(validate: false)
      self.resource.invite!(current_user)
    end

    self.resource ||= resource_class.invite!(invite_params, current_inviter)

    if resource.errors.empty?
      if params[:user_id]
        set_flash_message :notice, :send_instructions, :email => self.resource.name
      else
        set_flash_message :notice, :send_instructions, :email => self.resource.email
      end
      respond_with resource, :location => after_invite_path_for(resource)
    else
      respond_with_navigational(resource) { render :new }
    end
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
      team = Team.find(resource.invited_to_id)
      redirect_to team_path(team.associate(resource))
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:accept_invitation) do |u|
      u.permit(:name, :email, :invitation_token, :name, :gender, :city, {sports: []}, :user_id, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.for(:invite) do |u|
      u.permit(:email, :user_id, :invited_to_id)
    end
  end
end
