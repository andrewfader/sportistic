class UsersController < InheritedResources::Base
  before_filter :authenticate_user!
  authorize_resource

  def approve
    @user = User.find(params[:user_id])
    team = Team.associate(@user, current_user.id)
    flash[:notice] = "#{@user.name}'s request to join #{team.name} was approved"
    redirect_to team_path(team)
  end

  private

  def permitted_params
    params.permit(user: [:sports, {availability: []}, :distance_to_travel, :desire_to_join, :privacy_toggle, :position, :experience_level])
  end
end
