class GamesController < InheritedResources::Base
  respond_to :json

  def index
    super
  end

  def new
    if current_user.teams.present?
      @team = Team.find_by_id(params[:team_id])
    end
    super
  end

  def join
    @game = Game.find(params[:game_id])
    @game.users << current_user
    flash[:notice] = "You are going to play in the game."
    redirect_to game_path(@game)
  end

  private

  def permitted_params
    params.permit(game: [:title, :start, :end, :team_id, :public, :creator_id])
  end
end
