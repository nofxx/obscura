require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/photo_sets/new.html.erb" do
  include PhotoSetsHelper
  
  before(:each) do
    assigns[:photo_set] = stub_model(PhotoSet,
      :new_record? => true,
      :user => stub_model(User),
      :title => "value for title"
    )
  end

  it "should render new form" do
    render "/photo_sets/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", photo_sets_path) do
      with_tag("input#photo_set_user[name=?]", "photo_set[user]")
      with_tag("input#photo_set_title[name=?]", "photo_set[title]")
    end
  end
end


