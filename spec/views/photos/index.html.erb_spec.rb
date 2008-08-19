require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/photos/index.html.erb" do
  include PhotosHelper
  
  before(:each) do
    assigns[:photos] = [
      stub_model(Photo,
        :title => "value for title"
      ),
      stub_model(Photo,
        :title => "value for title"
      )
    ]
  end

  it "should render list of photos" do
    render "/photos/index.html.erb"
    response.should have_tag("tr>td", "value for title", 2)
  end
end

