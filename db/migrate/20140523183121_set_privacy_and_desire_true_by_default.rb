class SetPrivacyAndDesireTrueByDefault < ActiveRecord::Migration
  def change
    change_column :users, :desire_to_join, :boolean, default: true
    change_column :users, :privacy_toggle, :boolean, default: true
  end
end
