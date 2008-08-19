require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PhotoSetsController do

  def mock_photo_set(stubs={})
    @mock_photo_set ||= mock_model(PhotoSet, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all photo_sets as @photo_sets" do
      PhotoSet.should_receive(:find).with(:all).and_return([mock_photo_set])
      get :index
      assigns[:photo_sets].should == [mock_photo_set]
    end

    describe "with mime type of xml" do
  
      it "should render all photo_sets as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        PhotoSet.should_receive(:find).with(:all).and_return(photo_sets = mock("Array of PhotoSets"))
        photo_sets.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested photo_set as @photo_set" do
      PhotoSet.should_receive(:find).with("37").and_return(mock_photo_set)
      get :show, :id => "37"
      assigns[:photo_set].should equal(mock_photo_set)
    end
    
    describe "with mime type of xml" do

      it "should render the requested photo_set as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        PhotoSet.should_receive(:find).with("37").and_return(mock_photo_set)
        mock_photo_set.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new photo_set as @photo_set" do
      PhotoSet.should_receive(:new).and_return(mock_photo_set)
      get :new
      assigns[:photo_set].should equal(mock_photo_set)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested photo_set as @photo_set" do
      PhotoSet.should_receive(:find).with("37").and_return(mock_photo_set)
      get :edit, :id => "37"
      assigns[:photo_set].should equal(mock_photo_set)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created photo_set as @photo_set" do
        PhotoSet.should_receive(:new).with({'these' => 'params'}).and_return(mock_photo_set(:save => true))
        post :create, :photo_set => {:these => 'params'}
        assigns(:photo_set).should equal(mock_photo_set)
      end

      it "should redirect to the created photo_set" do
        PhotoSet.stub!(:new).and_return(mock_photo_set(:save => true))
        post :create, :photo_set => {}
        response.should redirect_to(photo_set_url(mock_photo_set))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved photo_set as @photo_set" do
        PhotoSet.stub!(:new).with({'these' => 'params'}).and_return(mock_photo_set(:save => false))
        post :create, :photo_set => {:these => 'params'}
        assigns(:photo_set).should equal(mock_photo_set)
      end

      it "should re-render the 'new' template" do
        PhotoSet.stub!(:new).and_return(mock_photo_set(:save => false))
        post :create, :photo_set => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested photo_set" do
        PhotoSet.should_receive(:find).with("37").and_return(mock_photo_set)
        mock_photo_set.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :photo_set => {:these => 'params'}
      end

      it "should expose the requested photo_set as @photo_set" do
        PhotoSet.stub!(:find).and_return(mock_photo_set(:update_attributes => true))
        put :update, :id => "1"
        assigns(:photo_set).should equal(mock_photo_set)
      end

      it "should redirect to the photo_set" do
        PhotoSet.stub!(:find).and_return(mock_photo_set(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(photo_set_url(mock_photo_set))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested photo_set" do
        PhotoSet.should_receive(:find).with("37").and_return(mock_photo_set)
        mock_photo_set.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :photo_set => {:these => 'params'}
      end

      it "should expose the photo_set as @photo_set" do
        PhotoSet.stub!(:find).and_return(mock_photo_set(:update_attributes => false))
        put :update, :id => "1"
        assigns(:photo_set).should equal(mock_photo_set)
      end

      it "should re-render the 'edit' template" do
        PhotoSet.stub!(:find).and_return(mock_photo_set(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested photo_set" do
      PhotoSet.should_receive(:find).with("37").and_return(mock_photo_set)
      mock_photo_set.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the photo_sets list" do
      PhotoSet.stub!(:find).and_return(mock_photo_set(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(photo_sets_url)
    end

  end

end
