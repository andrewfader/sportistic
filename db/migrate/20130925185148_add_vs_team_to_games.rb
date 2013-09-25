class AddVsTeamToGames < ActiveRecord::Migration
  def change
    add_column :games, :vs_team_id, :integer
    add_index :games, :vs_team_id
    add_index :games, :team_id
  end
end
