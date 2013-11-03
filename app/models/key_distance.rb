class KeyDistance < ActiveRecord::Base
  belongs_to :location
  belongs_to :key_location, :class_name=>"Location"
  validates_uniqueness_of :location_id, :scope=>:key_location_id
end

