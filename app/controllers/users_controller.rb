class UsersController < InheritedResources::Base
  before_filter :authenticate_user!
  authorize_resource

  def approve
    @user = User.find(params[:user_id])
    Team.associate(@user, current_user.id)
  end

  private

  def permitted_params
    params.permit(user: [:sports, {availability: []}, :distance_to_travel, :desire_to_join, :privacy_toggle, :position, :experience_level])
  end
end
