class TeamsController < InheritedResources::Base
  load_and_authorize_resource

  def index
    @matching_teams = Team.matching(current_user) if current_user
    super
  end

  def create
    super
    @team.associate(current_user)
  end

  def join
    if (@team = Team.find_by_id(params[:team_id]))
      UserMailer.join_request(current_user, @team).deliver
      @team.associate(current_user, false)
    end
    flash[:notice] = "A request to join this team has been sent to #{@team.captain.name}"
    redirect_to team_path(@team)
  end

  def destroy
    if params[:user_id]
      user_team = UserTeam.where(user_id: params[:user_id], team_id: params[:id]).first
      team = user_team.team
      user_team.destroy
      flash[:notice] = "You are no longer a member of #{team.name}"
      redirect_to team_path(team)
    else
      super
    end
  end

  def email
    @team = Team.find(params[:team_id])
  end

  def send_email
    team = Team.find(params[:team_id])
    users = params["user_ids"].map { |id| User.find(id) }
    UserMailer.team_message(users, team, params["email"]["body"]).deliver
    flash[:notice] = "Email sent to #{users.map(&:name).to_sentence}"
    redirect_to team_path(team)
  end

  private

  def permitted_params
    params.permit(team: [:name, :location, :sport, :league_name, :league_url, :location, :captain_id, :experience_level, :bio, :achievements, :photo, :team_type, :year_founded, {availability: []}, photos_attributes: ['title', 'image', '_destroy'], players_attributes: [:name]])
  end
end
