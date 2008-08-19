class CreatePhotoSets < ActiveRecord::Migration
  def self.up
    create_table :photo_sets do |t|
      t.references :user
      t.string :title

      t.timestamps
    end
    
    create_table :photo_photo_sets do |t|
      t.integer :photo_set_id
      t.integer :photo_id
    end    
    
    add_index :photo_photo_sets , [:photo_set_id]
    add_index :photo_photo_sets , [:photo_id]
    
  end

  def self.down
    drop_table :photo_sets
    drop_table :photo_photo_sets
  end
end
