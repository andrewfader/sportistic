class InvitationToken < ActiveRecord::Migration
  def change
    remove_index :users, :invitation_token
    add_index :users, :invitation_token
  end
end
