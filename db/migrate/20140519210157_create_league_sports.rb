class CreateLeagueSports < ActiveRecord::Migration
  def change
    create_table :league_sports do |t|
      t.belongs_to :league
      t.belongs_to :sport
    end
  end
end
