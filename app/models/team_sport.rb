class TeamSport < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :team
  belongs_to_active_hash :sport
end
