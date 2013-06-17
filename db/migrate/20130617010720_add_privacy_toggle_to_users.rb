class AddPrivacyToggleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :privacy_toggle, :boolean
  end
end
