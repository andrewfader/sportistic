class UsersController < InheritedResources::Base
  before_filter :authenticate_user!
  authorize_resource

  private

  def permitted_params
    params.permit(user: [:sports, {availability: []}, :distance_to_travel, :desire_to_join, :privacy_toggle, :position, :experience_level])
  end
end
