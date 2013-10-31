class AddIsKeyToLocations < ActiveRecord::Migration
  def change
    remove_column :locations,:distance_to_key
    add_column :locations,:is_key,:boolean
    rename_table :key_locations, :key_distances
    add_column :key_distances, :key_location_id,:integer

    add_column :key_distances, :bike_distance, :float
    add_column :key_distances, :bike_directions, :text
    
    add_column :key_distances, :bike_time, :time
    
    add_column :key_distances, :walk_distance, :float
    add_column :key_distances, :walk_directions, :text
    
    add_column :key_distances, :walk_time, :float

    add_column :key_distances, :transit_distance, :float
    add_column :key_distances, :transit_directions, :text
    add_column :key_distances, :transit_time, :time

    add_column :key_distances, :drive_distance, :float
    add_column :key_distances, :drive_directions, :text
    add_column :key_distances, :drive_time, :time

    
  end
end
