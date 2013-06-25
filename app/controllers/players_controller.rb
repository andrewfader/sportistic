class PlayersController < InheritedResources::Base

  def create
    create! { team_path(params[:team_id]) }
  end

  private

  def permitted_params
    params.permit(player: [:name, :team_id])
  end
end
