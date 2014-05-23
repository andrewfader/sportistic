class UsersController < InheritedResources::Base
  authorize_resource

  autocomplete :team, :name
  skip_authorize_resource only: :autocomplete_team_name

  def approve
    if @user = User.find_by_id(params[:user_id])
      if @team = Team.find_by_id(params[:team_id])
        if current_user == @team.captain
          @team.associate(@user)
          flash[:notice] = "#{@user.name}'s request to join #{@team.name} was approved"
          UserMailer.approval_notice(@user, @team).deliver
          path = team_path(@team)
        else
          flash[:alert] = "You are not the captain of #{@team.name}"
          path = team_path(@team)
        end
      end
      path ||= user_path(@user)
    end
    path ||= "/"
    redirect_to path
  end

  def update
    @user = User.find(params[:id])
    params["user"].delete("teams")
    if team_id = params["user"]["team_ids"]
      if team = Team.find_by_id(team_id.to_i)
        if !@user.teams.include? team
          UserMailer.join_request(current_user, team).deliver
          team.associate(@user, false)
        end
      end
    end
    params["user"].delete("team_ids")
    if params["user"]["user_sports_attributes"]
      params["user"]["user_sports_attributes"].each do |k,v|
        params["user"]["user_sports_attributes"][k]["position"] = v["position"].map(&:presence).compact
        params["user"]["user_sports_attributes"][k]["experience_level"] = v["experience_level"]
      end
    end

    super
  end

  def index
    @team_id = params[:team_id] if params[:team_id]
  end

  private

  def permitted_params
    params.permit(user: [{user_sports_attributes: [:id, :sport_id, {position: []}, :experience_level]}, {availability: []}, :experience_level, :distance_to_travel, :desire_to_join, :privacy_toggle, :team_ids, {teams: []}])

  end
end
