class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :fullname, :sports, :city, :privacy_toggle, :gender, :interests, :photo, :bio, :achievements, :distance_to_travel, :desire_to_join, :experience_level, :position, :availability
  has_many :user_teams
  has_many :teams, through: :user_teams

  mount_uploader :photo, ::PhotoUploader
  POSITIONS = { baseball: ["Pitcher","Catcher","1B","2B","3B","Outfield"],
                basketball: ["Guard","Forward","Center"],
                soccer: ["Goalie","Defense","Midfield","Forward"],
                softball: ["Pitcher","Catcher","1B","2B","3B","Outfield"],
                kickball: ["Pitcher","Catcher","1B","2B","3B","Outfield"] }

end
