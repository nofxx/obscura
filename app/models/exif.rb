class Exif < ActiveRecord::Base
  belongs_to :photo
  
  
  
  def aperture
    "f#{read_attribute(:aperture)}"
  end
end
