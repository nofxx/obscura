require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Exif do
  before(:each) do
    @valid_attributes = {
      :photo_id => 1,
      :camera => "CANON EOS 400D",
      :exposure => "0.000002",
      :aperture => "5.6",
      :iso => "100",
      :focal => "100",
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
  
  describe "Getters" do
    before(:each) do
      @exif = Exif.new(@valid_attributes)
    end
  
    it "should return aperture formatted" do
         @exif.aperture.should eql('f5.6') 
    end
  end
end
