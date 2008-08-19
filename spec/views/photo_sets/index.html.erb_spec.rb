require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/photo_sets/index.html.erb" do
  include PhotoSetsHelper
  
  before(:each) do
    assigns[:photo_sets] = [
      stub_model(PhotoSet,
        :user => stub_model(User),
        :title => "value for title"
      ),
      stub_model(PhotoSet,
        :user => stub_model(User),
        :title => "value for title"
      )
    ]
  end

  it "should render list of photo_sets" do
    render "/photo_sets/index.html.erb"
    response.should have_tag("tr>td", "value for title", 2)
  end
end

