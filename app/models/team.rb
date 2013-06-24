class Team < ActiveRecord::Base
  has_many :user_teams
  has_many :users, through: :user_teams
  attr_accessible :name, :location, :sport, :league_name, :league_url, :location, :captain_id, :experience_level, :bio, :achievements, :photo, :team_type, :year_founded, :availability
  validates_presence_of :name, :location, :sport
  serialize :availability

  mount_uploader :photo, ::PhotoUploader
end
