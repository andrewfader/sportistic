class Team < ActiveRecord::Base
  include Availability
  has_many :user_teams
  has_many :users, through: :user_teams
  serialize :availability
  validates_presence_of :name, :location, :sport

  mount_uploader :photo, ::PhotoUploader

  def self.matching(user)
    Team.select do |team|
      team.sport == user.sports &&
        (team.availability & user.availability).present?
    end
  end
end
