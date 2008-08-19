class CreateLocals < ActiveRecord::Migration
  def self.up
    create_table :locals do |t|
      t.references :photo, :null => false
      t.point :geom, :null => false, :srid => 4326, :with_z => true
    end
    add_index "locals", "geom", :spatial => true
  end


  def self.down
    drop_table :locals
  end
end
