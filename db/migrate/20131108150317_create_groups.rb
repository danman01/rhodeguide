class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id
      t.string :name
      t.text :description

      t.timestamps
    end
    add_column :locations, :group_id, :integer
    add_index :locations,:group_id
  end
end
