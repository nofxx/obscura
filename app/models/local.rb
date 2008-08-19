class Local < ActiveRecord::Base
  belongs_to :photo

  validates_presence_of :geom
end
