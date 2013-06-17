class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :location
      t.integer :captain_id
      t.string :sport
      t.integer :league_id
      t.boolean :external_league
      t.string :league_name
      t.string :league_url
      t.timestamps
    end
    create_table :user_teams do |t|
      t.integer :team_id
      t.integer :user_id
    end

  end

end
