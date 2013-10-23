class CreateKeyLocations < ActiveRecord::Migration
  def self.up
    create_table :key_locations do |t|
      t.integer :location_id
      t.timestamps
    end
    add_column :locations, :distance_to_key, :float
  end

  def self.down
    drop_table :key_locations
  end
end
