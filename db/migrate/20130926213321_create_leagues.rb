class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :url
      t.text :description
      t.timestamps
    end
    create_table :team_leagues do |t|
      t.integer :team_id
      t.integer :league_id
    end
    add_index :team_leagues, :team_id
    add_index :team_leagues, :league_id
  end
end
