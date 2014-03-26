class UserSport < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :sport
  serialize :position
  serialize :experience_level
end
