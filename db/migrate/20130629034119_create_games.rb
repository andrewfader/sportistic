class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.belongs_to :team
      t.belongs_to :creator
      t.boolean :public
      t.timestamps
    end
    create_table :user_games do |t|
      t.belongs_to :user
      t.belongs_to :game
    end
  end
end
