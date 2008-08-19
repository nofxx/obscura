require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PhotosController do
  describe "route generation" do

    it "should map { :controller => 'photos', :action => 'index' } to /photos" do
      route_for(:controller => "photos", :action => "index").should == "/photos"
    end
  
    it "should map { :controller => 'photos', :action => 'new' } to /photos/new" do
      route_for(:controller => "photos", :action => "new").should == "/photos/new"
    end
  
    it "should map { :controller => 'photos', :action => 'show', :id => 1 } to /photos/1" do
      route_for(:controller => "photos", :action => "show", :id => 1).should == "/photos/1"
    end
  
    it "should map { :controller => 'photos', :action => 'edit', :id => 1 } to /photos/1/edit" do
      route_for(:controller => "photos", :action => "edit", :id => 1).should == "/photos/1/edit"
    end
  
    it "should map { :controller => 'photos', :action => 'update', :id => 1} to /photos/1" do
      route_for(:controller => "photos", :action => "update", :id => 1).should == "/photos/1"
    end
  
    it "should map { :controller => 'photos', :action => 'destroy', :id => 1} to /photos/1" do
      route_for(:controller => "photos", :action => "destroy", :id => 1).should == "/photos/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'photos', action => 'index' } from GET /photos" do
      params_from(:get, "/photos").should == {:controller => "photos", :action => "index"}
    end
  
    it "should generate params { :controller => 'photos', action => 'new' } from GET /photos/new" do
      params_from(:get, "/photos/new").should == {:controller => "photos", :action => "new"}
    end
  
    it "should generate params { :controller => 'photos', action => 'create' } from POST /photos" do
      params_from(:post, "/photos").should == {:controller => "photos", :action => "create"}
    end
  
    it "should generate params { :controller => 'photos', action => 'show', id => '1' } from GET /photos/1" do
      params_from(:get, "/photos/1").should == {:controller => "photos", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'photos', action => 'edit', id => '1' } from GET /photos/1;edit" do
      params_from(:get, "/photos/1/edit").should == {:controller => "photos", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'photos', action => 'update', id => '1' } from PUT /photos/1" do
      params_from(:put, "/photos/1").should == {:controller => "photos", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'photos', action => 'destroy', id => '1' } from DELETE /photos/1" do
      params_from(:delete, "/photos/1").should == {:controller => "photos", :action => "destroy", :id => "1"}
    end
  end
end
