class CreateIndices < ActiveRecord::Migration
  def change
    add_index :user_teams, :user_id
    add_index :user_teams, :team_id
    add_index :teams, :captain_id
  end
end
