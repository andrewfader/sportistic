class League < ActiveRecord::Base
  has_many :teams, through: :team_leagues
  has_many :team_leagues
  validates_presence_of :name, :url
end
