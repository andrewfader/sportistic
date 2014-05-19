class League < ActiveRecord::Base
  has_many :teams, through: :team_leagues
  has_many :team_leagues
  validates_presence_of :name, :url
  has_many :league_sports
  has_many :sports, through: :league_sports
  accepts_nested_attributes_for :league_sports

  def sports
    league_sports.map(&:sport)
  end
end
