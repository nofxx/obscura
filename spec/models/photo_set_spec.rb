require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PhotoSet do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :title => "value for title"
    }
  end

  it "should create a new instance given valid attributes" do
    PhotoSet.create!(@valid_attributes)
  end
end
