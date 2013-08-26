class Team < ActiveRecord::Base
  include Availability
  has_many :user_teams, dependent: :destroy
  has_many :users, through: :user_teams
  has_many :players, dependent: :destroy
  has_many :games, dependent: :destroy
  accepts_nested_attributes_for :players
  belongs_to :captain, class_name: User
  serialize :availability
  validates_presence_of :name, :location, :sport

  mount_uploader :photo, ::PhotoUploader

  def self.matching(user)
    Team.select do |team|
      user.sports_names.any? do |sport|
        team.sport == sport
      end.present? && (team.availability & user.availability).present?
    end
  end

  def associate(user, membership=true)
    if !user.teams.include? self
      user.teams << self
    end
    user_teams.find_by_user_id(user.id).update_attributes!(membership: membership)
    self
  end

  def self.associate(user, captain_id, membership=true)
    if (team = Team.where(captain_id: captain_id).try(:last))
      team.associate(user, membership)
    end
  end

  def member_users
    user_teams.where(membership: true).map(&:user)
  end

  def pending_users
    user_teams.where(membership: false).map(&:user)
  end
end
