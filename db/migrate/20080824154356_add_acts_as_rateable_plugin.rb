class AddActsAsRateablePlugin < ActiveRecord::Migration
  def self.up
  create_table :ratings, :force => true do |t|
    t.integer :rating, :default => 0
    t.datetime :created_at, :null => false
    t.string :rateable_type, :limit => 15, :default => "", :null => false
    t.integer :rateable_id, :default => 0, :null => false
    t.integer :user_id, :default => 0, :null => false
  end
  	
  end

  def self.down
  	drop_table :ratings
  end
end
