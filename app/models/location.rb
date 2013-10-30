class Location < ActiveRecord::Base
  geocoded_by :address
  validates_uniqueness_of :address, :latitude,:longitude
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }
  after_save :calculate_distance_to_key_location, :if => lambda{ |obj| obj.address_changed? }
  # TODO key_location distances
  has_one :key_location
  belongs_to :user

  # setters to only allow digits
  def price=(price)
    write_attribute(:price, price.gsub(/\D/, ''))
  end
  # setters to only allow digits
  def taxes=(taxes)
    write_attribute(:taxes, taxes.gsub(/\D/, ''))
  end

  def update_distance_to_key(loc)
    if self.geocoded?
      distance = Geocoder::Calculations.distance_between(self,[loc.latitude,loc.longitude]) rescue nil
      self.distance_to_key = distance
      self.save if self.valid?
    end
  end

  private
  def calculate_distance_to_key_location
    if key_location = KeyLocation.first # lazy get first key location
      loc = key_location.location
      if loc == self # key location is THIS location, update all other locations
        Location.all.each do |location|
          location.update_distance_to_key(loc)
        end
      else
        self.update_distance_to_key(loc)      
      end
      
    end
  end
end
