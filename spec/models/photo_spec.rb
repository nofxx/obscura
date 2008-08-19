require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Photo do
  before(:each) do
    @valid_attributes = {
      :title => "value for title"
    }
  end

  it "should create a new instance given valid attributes" do
    Photo.create!(@valid_attributes)
  end
end
