class InvitationsController < Devise::InvitationsController
  before_filter :configure_permitted_parameters

  def after_accept_path_for(user)
    team = Team.where(captain_id: current_user.invited_by_id).try(:first)
    current_user.teams << team if team
    team_path(current_user.teams.first)
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:accept_invitation) do |u|
      u.permit(:name, :email, :invitation_token, :fullname, :gender, :city, :sports)
    end
  end
end
