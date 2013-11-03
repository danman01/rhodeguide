class DropIndexFromLocations < ActiveRecord::Migration
  def change
    remove_index :locations, :column => :user_id
    add_index :locations,:user_id
    add_index :key_distances,[:location_id,:key_location_id],:unique=>true
    
  end
end
