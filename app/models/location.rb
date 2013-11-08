class Location < ActiveRecord::Base
  geocoded_by :address
  validates_uniqueness_of :address, :latitude,:longitude
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }
  after_save :calculate_key_distances, :if => lambda{ |obj| obj.address_changed? }
  has_many :acts_as_key, :foreign_key=>"key_location_id", :class_name => "KeyDistance", :dependent => :destroy
  has_many :key_distances, :foreign_key=>"location_id", :class_name =>"KeyDistance", :dependent => :destroy
  belongs_to :group
  belongs_to :user

  # setters to only allow digits
  def price=(price)
    write_attribute(:price, price.gsub(/\D/, ''))
  end
  # setters to only allow digits
  def taxes=(taxes)
    write_attribute(:taxes, taxes.gsub(/\D/, ''))
  end

  # updates the distance between the passed in location in the object that is calilng this method, which is another location
  # second param, self_is_key, helps the new key_distance table entry by creating the appropriate associations
  def update_distance_to_key(loc, self_is_key)
    # do not calculate for own distance to itself
    if self == loc
      puts "self is loc..returning..."
      return
    else
      # if location (self) is a key location, then loc refers to each of the users' other locations (non-keys)
      if self_is_key
        key_location_id = self.id
      else
        key_location_id = loc.id
      end
      if self.geocoded?
        distance = Geocoder::Calculations.distance_between(self,[loc.latitude,loc.longitude]) rescue nil
        # build new key_distance
        key_distance = self.key_distances.build()
        key_distance.key_location_id = key_location_id
        # lazy just looking at drive distance 
        key_distance.drive_distance = distance
        if key_distance.save
          puts "\n =================== \n key distance saved!\n ==================="
          puts key_distance.to_yaml
        end
      end
    end
  end

  private
  # after location is saved and the address is updated, run this method
  # This should either do:
  # if location is a key location (is_key), update all other locations' keyDistance entry with respect to this key location
  # else update just this locations' key distance entries with respect to other key distances
  def calculate_key_distances
    user = self.user
    
    if self.is_key? # if a key location is changed, update all the others
      loc = self
      # get location's user (owner), then get all that users' locations, and update them based on this new key
      # second arg is self_is_key
      user.locations.each do |location|
        location.update_distance_to_key(loc, true)
      end
    else
      # location being updated just needs to recalculate distances to known key locations for itself
      # other locations remain untouched
       keys = user.locations.where(:is_key => true)
       keys.each do |key|
         self.update_distance_to_key(key, false)      
       end
    end
      
  end
end
