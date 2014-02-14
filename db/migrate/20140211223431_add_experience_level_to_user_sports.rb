class AddExperienceLevelToUserSports < ActiveRecord::Migration
  def change
    add_column :user_sports, :experience_level, :string
  end
end
