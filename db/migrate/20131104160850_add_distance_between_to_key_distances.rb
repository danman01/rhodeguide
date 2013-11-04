class AddDistanceBetweenToKeyDistances < ActiveRecord::Migration
  def change
    add_column :key_distances, :distance_between, :float
  end
end
