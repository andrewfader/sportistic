class User < ActiveRecord::Base
  include Availability
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  has_many :user_teams
  has_many :teams, through: :user_teams
  serialize :availability
  validates_presence_of :name, :email, :sports, :city, :gender

  mount_uploader :photo, ::PhotoUploader
  POSITIONS = { baseball: ["Pitcher","Catcher","1B","2B","3B","Outfield"],
                basketball: ["Guard","Forward","Center"],
                soccer: ["Goalie","Defense","Midfield","Forward"],
                softball: ["Pitcher","Catcher","1B","2B","3B","Outfield"],
                kickball: ["Pitcher","Catcher","1B","2B","3B","Outfield"] }

  def member_teams
    user_teams.where(membership: true).map(&:team)
  end
end
