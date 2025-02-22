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

  def new
    @team.team_sports.build if @team.team_sports.empty?
    @team.team_league = TeamLeague.new
    super
  end

  def edit
    @team.team_sports.build if @team.team_sports.empty?
    @team.team_league = TeamLeague.new if @team.team_league == nil
    super
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
    if params["user_ids"].present?
      users = params["user_ids"].map { |id| User.find(id) }
      UserMailer.team_message(users, team, params["email"]["subject"], params["email"]["body"]).deliver
      flash[:notice] = "Email sent to #{users.map(&:name).to_sentence}"
      redirect_to team_path(team)
    else
      flash[:alert] = "No recipients selected"
      redirect_to team_email_path(team)
    end
  end

  private

  def permitted_params
    params.permit(team: [:name, :location, :sport, {team_league_attributes: [:league_id, :id]}, :location, :captain_id, :experience_level, :bio, :achievements, :photo, :team_type, :year_founded, {availability: []}, {photos_attributes: ['title', 'image', '_destroy']}, {players_attributes: [:name]}, {team_sports_attributes: [:sport_id, :id]}])
  end
end
