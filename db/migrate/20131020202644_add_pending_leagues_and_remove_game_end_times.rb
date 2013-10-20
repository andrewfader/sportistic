class AddPendingLeaguesAndRemoveGameEndTimes < ActiveRecord::Migration
  def change
    remove_column :games, :end, :datetime
    add_column :leagues, :pending, :boolean, default: false
    add_column :users, :invitation_created_at, :datetime
    change_column :users, :invitation_token, :string, limit: nil
    remove_index :users, :invitation_token
    add_index :users, :invitation_token, :unique => true
    change_column :users, :encrypted_password, :string, :null => true
  end
end
