class PhotoSet < ActiveRecord::Base
  belongs_to :user
  has_many :photos
end
