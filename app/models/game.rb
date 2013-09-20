class Game < ActiveRecord::Base
  has_many :user_games
  has_many :users, through: :user_games
  belongs_to :team
  belongs_to :creator, class_name: User
  validates_presence_of :team_id, :start

  def url
    "/games/#{id}"
  end

  def as_json(options={})
    super.merge(url: url)
  end

  def start
    super ?  super.strftime('%m/%d/%Y') : super
  end

  def end
    super ?  super.strftime('%m/%d/%Y') : super
  end
end
