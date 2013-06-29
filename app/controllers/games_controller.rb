class GamesController < InheritedResources::Base
  respond_to :json

  def index
    super
    @games = [events: @games]
  end
  private
  def permitted_params
    params.permit(game: [:title, :start, :end, :team_id, :public, :creator_id])
  end
end
