class Team < ActiveRecord::Base
  include Availability
  has_many :user_teams
  has_many :users, through: :user_teams
  has_many :players
  accepts_nested_attributes_for :players
  belongs_to :captain, class_name: User
  serialize :availability
  validates_presence_of :name, :location, :sport

  mount_uploader :photo, ::PhotoUploader

  def self.matching(user)
    Team.select do |team|
      team.sport == user.sports &&
        (team.availability & user.availability).present?
    end
  end

  def self.associate(user, id)
    team = Team.where(captain_id: id).try(:first)
    if team && !user.teams.include?(team)
      user.teams << team
    end
    team
  end
end
