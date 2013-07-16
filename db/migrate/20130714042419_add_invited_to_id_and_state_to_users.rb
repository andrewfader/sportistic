class AddInvitedToIdAndStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :invited_to_id, :integer
    add_column :users, :state, :string
  end
end
