require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Local do
  before(:each) do
    @valid_attributes = {
      :photo_id => 1,
      :geom => '01010000A0E610000000000000387D47C00E000000643135C0000000000000F03F'
    }
  end

  it "should create a new instance given valid attributes" do
    Local.create!(@valid_attributes)
  end
end
