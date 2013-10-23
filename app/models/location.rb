class Location < ActiveRecord::Base
  geocoded_by :address
  validates_uniqueness_of :address, :latitude,:longitude
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }
  after_validation :calculate_distance_to_key_location, :if => lambda{ |obj| obj.address_changed? }
  has_one :key_location

  private
  def calculate_distance_to_key_location
    if key_location = KeyLocation.first # lazy get first key location
      loc = key_location.location
      if self.geocoded?
        distance = Geocoder::Calculations.distance_between(self,[loc.latitude,loc.longitude]) rescue nil
        self.distance_to_key = distance
      end
    end
  end
end
