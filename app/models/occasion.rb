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
    belongs_to :user
    has_many :users, :through => :rsvp
    has_many :rsvps

    geocoded_by :location   #using geocoder to convert location into coordinates
    after_validation :geocode

    def self.keyword_search(keywords)   #make keyword_search a class level method, we try to make the funciton in controller slim
      keywords = "%" + keywords+ "%"
      Occasion.where("title LIKE ? OR description LIKE?", keywords, keywords)  # Acitive Record saves us from writing DB queries in SQL manualy/direclty. here LIKE Is a SQL operator, it is not case sensitive,   % % is like * in reqgular expresison ( anything ) %% is called wildcard  ? is for protecting from SQL injection
    end


    def self.location_search(location)   #make keyword_search a class level method, we try to make the funciton in controller slim
      location = "%" + location+ "%"
      Occasion.where("location LIKE ?", location)  # Acitive Record saves us from writing DB queries in SQL manualy/direclty. here LIKE Is a SQL operator, it is not case sensitive,   % % is like * in reqgular expresison ( anything ) %% is called wildcard  ? is for protecting from SQL injection
    end


end
