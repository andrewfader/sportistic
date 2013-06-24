class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :fullname, :sports, :location, :privacy_toggle, :gender, :interests, :photo
  has_many :user_teams
  has_many :teams, through: :user_teams

  mount_uploader :photo, ::PhotoUploader
end
