class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :sports, :string
    add_column :users, :location, :string
    add_column :users, :fullname, :string
  end
end
