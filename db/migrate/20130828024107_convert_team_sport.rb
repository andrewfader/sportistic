class ConvertTeamSport < ActiveRecord::Migration
  def change
    remove_column :teams, :sport
    create_table :team_sports do |t|
      t.integer :team_id
      t.integer :sport_id
      t.timestamps
    end
    create_table :sports do |t|
      t.string :name
      t.string :positions
      t.timestamps
    end
  end
end
