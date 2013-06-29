class TeamsController < InheritedResources::Base
  load_and_authorize_resource
  def index
    @matching_teams = Team.matching(current_user) if current_user
    super
  end

  def create
    super
    @team.users << current_user
  end

  def join
    @team = Team.find_by_id(params[:team_id])
    @team.associate(current_user, false) if @team
  end

  private

  def permitted_params
    params.permit(team: [:name, :location, :sport, :league_name, :league_url, :location, :captain_id, :experience_level, :bio, :achievements, :photo, :team_type, :year_founded, :availability, photos_attributes: ['title', 'image', '_destroy'], players_attributes: [:name]])
  end
end
