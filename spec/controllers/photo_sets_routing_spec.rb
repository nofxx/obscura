require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PhotoSetsController do
  describe "route generation" do

    it "should map { :controller => 'photo_sets', :action => 'index' } to /photo_sets" do
      route_for(:controller => "photo_sets", :action => "index").should == "/photo_sets"
    end
  
    it "should map { :controller => 'photo_sets', :action => 'new' } to /photo_sets/new" do
      route_for(:controller => "photo_sets", :action => "new").should == "/photo_sets/new"
    end
  
    it "should map { :controller => 'photo_sets', :action => 'show', :id => 1 } to /photo_sets/1" do
      route_for(:controller => "photo_sets", :action => "show", :id => 1).should == "/photo_sets/1"
    end
  
    it "should map { :controller => 'photo_sets', :action => 'edit', :id => 1 } to /photo_sets/1/edit" do
      route_for(:controller => "photo_sets", :action => "edit", :id => 1).should == "/photo_sets/1/edit"
    end
  
    it "should map { :controller => 'photo_sets', :action => 'update', :id => 1} to /photo_sets/1" do
      route_for(:controller => "photo_sets", :action => "update", :id => 1).should == "/photo_sets/1"
    end
  
    it "should map { :controller => 'photo_sets', :action => 'destroy', :id => 1} to /photo_sets/1" do
      route_for(:controller => "photo_sets", :action => "destroy", :id => 1).should == "/photo_sets/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'photo_sets', action => 'index' } from GET /photo_sets" do
      params_from(:get, "/photo_sets").should == {:controller => "photo_sets", :action => "index"}
    end
  
    it "should generate params { :controller => 'photo_sets', action => 'new' } from GET /photo_sets/new" do
      params_from(:get, "/photo_sets/new").should == {:controller => "photo_sets", :action => "new"}
    end
  
    it "should generate params { :controller => 'photo_sets', action => 'create' } from POST /photo_sets" do
      params_from(:post, "/photo_sets").should == {:controller => "photo_sets", :action => "create"}
    end
  
    it "should generate params { :controller => 'photo_sets', action => 'show', id => '1' } from GET /photo_sets/1" do
      params_from(:get, "/photo_sets/1").should == {:controller => "photo_sets", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'photo_sets', action => 'edit', id => '1' } from GET /photo_sets/1;edit" do
      params_from(:get, "/photo_sets/1/edit").should == {:controller => "photo_sets", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'photo_sets', action => 'update', id => '1' } from PUT /photo_sets/1" do
      params_from(:put, "/photo_sets/1").should == {:controller => "photo_sets", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'photo_sets', action => 'destroy', id => '1' } from DELETE /photo_sets/1" do
      params_from(:delete, "/photo_sets/1").should == {:controller => "photo_sets", :action => "destroy", :id => "1"}
    end
  end
end
