class Game < ActiveRecord::Base
  # self.include_root_in_json = true
  has_many :user_games
  has_many :users, through: :user_games
  # def as_json(options={})
    # super.merge!(url: game_path(id))
  # end
end
