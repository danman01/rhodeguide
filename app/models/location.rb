class Location < ActiveRecord::Base
  geocoded_by :address
  validates_uniqueness_of :address, :latitude,:longitude
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }
  after_save :calculate_distance_to_key_location, :if => lambda{ |obj| obj.address_changed? }
  has_many :key_distances
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
      # build new key_distance
      key_distance = self.key_distances.build()
      # lazy just looking at drive distance 
      key_distance.drive_distance = distance
      if key_distance.save
        puts "key distance saved!"
      end
    end
  end

  private
  def calculate_distance_to_key_location
    user = self.user
    
    if self.is_key? # if a key location is changed, update all the others
      loc = self
      # get location user, then get all that users' locations, and update them
      user.locations.each do |location|
        location.update_distance_to_key(loc)
      end
    else
      # location just needs distances to know key locatinos for itself. other locations remain untouched
       keys = user.locations.where(:is_key => true)
       keys.each do |key|
         self.update_distance_to_key(key)      
       end
    end
      
  end
end
