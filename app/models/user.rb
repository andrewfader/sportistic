class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :user_teams
  has_many :teams, through: :user_teams

  has_many :user_games
  has_many :games, through: :user_games

  has_many :user_sports
  has_many :sports, through: :user_sports

  serialize :availability
  validates_presence_of :name, :email, :city, :gender

  mount_uploader :photo, ::PhotoUploader

  accepts_nested_attributes_for :user_sports

  def sports
    user_sports.map(&:sport)
  end

  def member_teams
    user_teams.where(membership: true).map(&:team)
  end

  def pending_teams
    user_teams.where(membership: false).map(&:team)
  end

  def availability
    super ? super.map(&:presence).compact : []
  end
end
