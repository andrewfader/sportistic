class LeagueSport < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :league
  belongs_to_active_hash :sport
end
