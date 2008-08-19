class Photo < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :media, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  has_one :exif
  has_one :local
  
  
  
  
end
