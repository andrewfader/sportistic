class AddLocationToGames < ActiveRecord::Migration
  def change
    add_column :games, :location, :string
    add_column :games, :latitude, :string
    add_column :games, :longitude, :string
  end
end
