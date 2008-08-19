require 'mime/types'
require 'exifr'

class Photo < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :photo_sets, :join_table => "photo_photo_sets", :select => 'photo_sets.*'#, :foreign_key => "photo_sets_id"
  
  has_attached_file :media, :styles => { 
    :medium => "300x300>", 
    :thumb => "100x100>" 
  }
  
  # Paperclip Validations
  validates_attachment_presence :media
  validates_attachment_content_type :media, :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg']
  
  has_one :exif
  has_one :local
  
  #EXIFR::JPEG.new('').inspect
  
  # Fix the mime types. Make sure to require the mime-types gem
  def swfupload_file=(data)
    data.content_type = MIME::Types.type_for(data.original_filename).to_s
    self.media = data
  end
end
