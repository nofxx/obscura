require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/photos/edit.html.erb" do
  include PhotosHelper
  
  before(:each) do
    assigns[:photo] = @photo = stub_model(Photo,
      :new_record? => false,
      :title => "value for title"
    )
  end

  it "should render edit form" do
    render "/photos/edit.html.erb"
    
    response.should have_tag("form[action=#{photo_path(@photo)}][method=post]") do
      with_tag('input#photo_title[name=?]', "photo[title]")
    end
  end
end


