require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Exif do
  before(:each) do
    @valid_attributes = {
      :photo => ,
      :camera => "value for camera",
      :exposure => "1.5",
      :aperture => "1.5",
      :iso => "1",
      :focal => "1",
      :flash => "value for flash",
      :expo_program => "value for expo_program",
      :expo_bias => "value for expo_bias",
      :expo_mode => "value for expo_mode",
      :white_balance => "value for white_balance",
      :color_space => "value for color_space",
      :color_depth => "value for color_depth",
      :lens => "value for lens",
      :metering_mode => "value for metering_mode"
    }
  end

  it "should create a new instance given valid attributes" do
    Exif.create!(@valid_attributes)
  end
end
