class Location < ActiveRecord::Base
  geocoded_by :address
  validates_uniqueness_of :address, :latitude,:longitude
  after_validation :geocode, :if => :address_changed?
  has_one :key_location
end
