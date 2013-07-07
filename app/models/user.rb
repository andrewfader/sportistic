class User < ActiveRecord::Base
  include Availability
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :user_teams
  has_many :teams, through: :user_teams

  has_many :user_games
  has_many :games, through: :user_games

  serialize :availability
  serialize :sports
  serialize :position
  validates_presence_of :name, :email, :sports, :city, :gender

  mount_uploader :photo, ::PhotoUploader

  accepts_nested_attributes_for :teams

  def self.possible_positions(sports)
    positions = { baseball: ["Pitcher","Catcher","1B","2B","3B","Outfield"],
                  basketball: ["Guard","Forward","Center"],
                  soccer: ["Goalie","Defense","Midfield","Forward"],
                  softball: ["Pitcher","Catcher","1B","2B","3B","Outfield"],
                  kickball: ["Pitcher","Catcher","1B","2B","3B","Outfield"] }
    Array(sports).map do |sport|
      sport = sport.downcase.to_sym
      positions[sport]
    end.flatten.uniq
  end

  def member_teams
    user_teams.where(membership: true).map(&:team)
  end

  def pending_teams
    user_teams.where(membership: false).map(&:team)
  end

  def sports
    super ? super.map(&:presence).compact : []
  end

  def position
    super ? super.map(&:presence).compact : []
  end
end
