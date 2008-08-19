require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/photos/new.html.erb" do
  include PhotosHelper
  
  before(:each) do
    assigns[:photo] = stub_model(Photo,
      :new_record? => true,
      :title => "value for title"
    )
  end

  it "should render new form" do
    render "/photos/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", photos_path) do
      with_tag("input#photo_title[name=?]", "photo[title]")
    end
  end
end


