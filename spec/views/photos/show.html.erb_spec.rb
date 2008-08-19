require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/photos/show.html.erb" do
  include PhotosHelper
  
  before(:each) do
    assigns[:photo] = @photo = stub_model(Photo,
      :title => "value for title"
    )
  end

  it "should render attributes in <p>" do
    render "/photos/show.html.erb"
    response.should have_text(/value\ for\ title/)
  end
end

