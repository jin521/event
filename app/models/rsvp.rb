class Rsvp < ActiveRecord::Base
  belongs_to :user
  belongs_to :occasion
  validates_uniqueness_of :occasion_id, :scope => :user_id # Magic
end
