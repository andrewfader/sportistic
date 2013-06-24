class UserFields < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.remove :location
      t.remove :interests
      t.string :bio
      t.string :phone
      t.string :city
      t.string :achievements
      t.string :experience_level
      t.boolean :desire_to_join
      t.string :distance_to_travel
    end
  end
end
