class CreateUserSports < ActiveRecord::Migration
  def change
    remove_column :users, :sports
    remove_column :users, :position
    create_table :user_sports do |t|
      t.integer :user_id
      t.string :position
      t.integer :sport_id
    end
  end
end
