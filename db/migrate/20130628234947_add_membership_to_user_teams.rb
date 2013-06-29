class AddMembershipToUserTeams < ActiveRecord::Migration
  def change
    add_column :user_teams, :membership, :boolean
    UserTeam.update_all(membership: true)
  end
end
