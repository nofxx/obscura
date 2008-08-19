require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/photo_sets/show.html.erb" do
  include PhotoSetsHelper
  
  before(:each) do
    assigns[:photo_set] = @photo_set = stub_model(PhotoSet,
      :user => stub_model(User),
      :title => "value for title"
    )
  end

  it "should render attributes in <p>" do
    render "/photo_sets/show.html.erb"
    response.should have_text(//)
    response.should have_text(/value\ for\ title/)
  end
end

