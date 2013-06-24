class AddAvailabilityToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :availability, :string
    add_column :teams, :photo, :string
  end
end
