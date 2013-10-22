class AddHouse < ActiveRecord::Migration
  def change
    add_column :locations,:beds,:integer
    add_column :locations,:baths,:float
    add_column :locations,:price,:integer
    add_column :locations, :phone, :string
    add_column :locations,:name,:string
    add_column :locations,:notes,:text
    add_column :locations,:neighborhood,:string
    add_column :locations, :taxes, :integer
    add_column :locations, :link, :string

    
    
    
    
    
  end
end
