class AddLocationToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :location, :string
  end
end
