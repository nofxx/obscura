class Photo < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :photo_sets, :join_table => "photo_photo_sets", :select => 'photo_sets.*'#, :foreign_key => "photo_sets_id"
  
  has_attached_file :media, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  has_one :exif
  has_one :local
  
end
