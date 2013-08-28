class UserSportsController < InheritedResources::Base
  # authorize_resource
  respond_to :json

  def index
    respond_with current_user.user_sports.to_json
  end

  def destroy
    super
    head :ok
  end

  def create
    super
    head :ok
  end

  private

  def permitted_params
    params.permit(user_sport: [:user_id, :sport_id])
  end
end
