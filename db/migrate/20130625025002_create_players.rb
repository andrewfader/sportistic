class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.belongs_to :team
      t.timestamps
    end
    rename_column :users, :fullname, :name
  end
end
