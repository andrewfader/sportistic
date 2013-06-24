class TeamsController < InheritedResources::Base
  authorize_resource
  def index
    @matching_teams = Team.select do |team|
      team.sport == current_user.sports
      (Array.wrap(team.availability) & current_user.availability).present?
    end
    super
  end
end
