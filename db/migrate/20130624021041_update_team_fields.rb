class UpdateTeamFields < ActiveRecord::Migration
  def change
    add_column :teams, :experience_level, :string
    add_column :teams, :looking_free_agents, :boolean
    add_column :teams, :privacy_toggle, :boolean
    add_column :teams, :team_type, :string
    add_column :teams, :year_founded, :string
    add_column :teams, :bio, :text
    change_column :users, :bio, :text
    add_column :teams, :achievements, :text
  end
end
