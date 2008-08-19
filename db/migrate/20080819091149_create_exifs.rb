class CreateExifs < ActiveRecord::Migration
  def self.up
    create_table :exifs do |t|
      t.references :photo, :null => false
      t.string :camera, :limit => 100
      
      t.float :exposure, :aperture
      
      t.integer :iso, :focal, :color_depth      
      
      t.string :flash, :expo_program, :expo_bias, :expo_mode, :limit => 100
      t.string :white_balance, :color_space, :limit => 30
      t.string :lens, :limit => 150
      t.string :metering_mode, :limit => 50

    end
  end

  def self.down
    drop_table :exifs
  end
end
