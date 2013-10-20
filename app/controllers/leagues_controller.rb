class LeaguesController < InheritedResources::Base
  def index
    @leagues = League.where(pending: false)
  end

  def create
    super do
      flash[:notice] = "League suggestion submitted; an administrator will review and approve it soon."
      leagues_path
    end
  end

  private

  def permitted_params
    params.permit(league: [:name, :url, :description, :pending])
  end
end
