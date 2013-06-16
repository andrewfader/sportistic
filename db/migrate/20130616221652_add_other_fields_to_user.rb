class AddOtherFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :interests, :string
  end
end
