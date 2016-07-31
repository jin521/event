# == Schema Information
#
# Table name: occasions
#
#  id          :integer          not null, primary key
#  title       :string
#  date        :date
#  image       :string
#  location    :string
#  latitude    :float
#  longitude   :float
#  description :text
#  website     :string
#  email       :string
#  phone       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Occasion < ActiveRecord::Base
  has_and_belongs_to_many :users

    geocoded_by :location
    after_validation :geocode

end
