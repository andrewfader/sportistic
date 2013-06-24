class TeamsController < InheritedResources::Base
  authorize_resource
  def index
    @matching_teams = Team.select do |team|
      team.sport == current_user.sports
      (Array.wrap(team.availability) & current_user.availability).map(&:presence).compact.present?
    end
    super
  end
end
