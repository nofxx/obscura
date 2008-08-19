require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PhotosController do

  def mock_photo(stubs={})
    @mock_photo ||= mock_model(Photo, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all photos as @photos" do
      Photo.should_receive(:find).with(:all).and_return([mock_photo])
      get :index
      assigns[:photos].should == [mock_photo]
    end

    describe "with mime type of xml" do
  
      it "should render all photos as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Photo.should_receive(:find).with(:all).and_return(photos = mock("Array of Photos"))
        photos.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested photo as @photo" do
      Photo.should_receive(:find).with("37").and_return(mock_photo)
      get :show, :id => "37"
      assigns[:photo].should equal(mock_photo)
    end
    
    describe "with mime type of xml" do

      it "should render the requested photo as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Photo.should_receive(:find).with("37").and_return(mock_photo)
        mock_photo.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new photo as @photo" do
      Photo.should_receive(:new).and_return(mock_photo)
      get :new
      assigns[:photo].should equal(mock_photo)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested photo as @photo" do
      Photo.should_receive(:find).with("37").and_return(mock_photo)
      get :edit, :id => "37"
      assigns[:photo].should equal(mock_photo)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created photo as @photo" do
        Photo.should_receive(:new).with({'these' => 'params'}).and_return(mock_photo(:save => true))
        post :create, :photo => {:these => 'params'}
        assigns(:photo).should equal(mock_photo)
      end

      it "should redirect to the created photo" do
        Photo.stub!(:new).and_return(mock_photo(:save => true))
        post :create, :photo => {}
        response.should redirect_to(photo_url(mock_photo))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved photo as @photo" do
        Photo.stub!(:new).with({'these' => 'params'}).and_return(mock_photo(:save => false))
        post :create, :photo => {:these => 'params'}
        assigns(:photo).should equal(mock_photo)
      end

      it "should re-render the 'new' template" do
        Photo.stub!(:new).and_return(mock_photo(:save => false))
        post :create, :photo => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested photo" do
        Photo.should_receive(:find).with("37").and_return(mock_photo)
        mock_photo.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :photo => {:these => 'params'}
      end

      it "should expose the requested photo as @photo" do
        Photo.stub!(:find).and_return(mock_photo(:update_attributes => true))
        put :update, :id => "1"
        assigns(:photo).should equal(mock_photo)
      end

      it "should redirect to the photo" do
        Photo.stub!(:find).and_return(mock_photo(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(photo_url(mock_photo))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested photo" do
        Photo.should_receive(:find).with("37").and_return(mock_photo)
        mock_photo.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :photo => {:these => 'params'}
      end

      it "should expose the photo as @photo" do
        Photo.stub!(:find).and_return(mock_photo(:update_attributes => false))
        put :update, :id => "1"
        assigns(:photo).should equal(mock_photo)
      end

      it "should re-render the 'edit' template" do
        Photo.stub!(:find).and_return(mock_photo(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested photo" do
      Photo.should_receive(:find).with("37").and_return(mock_photo)
      mock_photo.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the photos list" do
      Photo.stub!(:find).and_return(mock_photo(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(photos_url)
    end

  end

end
