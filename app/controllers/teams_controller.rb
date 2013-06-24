class TeamsController < InheritedResources::Base
  authorize_resource
  def index
    @matching_teams = Team.matching(current_user) if current_user
    super
  end
end
