class AddAvailabilityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :availability, :string
    add_column :users, :position, :string
  end
end
