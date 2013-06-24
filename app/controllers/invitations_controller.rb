class InvitationsController < Devise::InvitationsController
  def after_accept_path_for(user)
    team = Team.where(captain_id: current_user.invited_by_id).first
    current_user.update!(team: team)
    team_path(team)
  end
end
