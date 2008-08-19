class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.references :user
      
      t.string :title, :limit => 100
      t.string :media_file_name
      t.string :media_content_type, :limit => 20
      t.integer :media_file_size      
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
