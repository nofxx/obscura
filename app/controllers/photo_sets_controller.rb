class PhotoSetsController < ApplicationController
  # GET /photo_sets
  # GET /photo_sets.xml
  def index
    @photo_sets = PhotoSet.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photo_sets }
    end
  end

  # GET /photo_sets/1
  # GET /photo_sets/1.xml
  def show
    @photo_set = PhotoSet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photo_set }
    end
  end

  # GET /photo_sets/new
  # GET /photo_sets/new.xml
  def new
    @photo_set = PhotoSet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo_set }
    end
  end

  # GET /photo_sets/1/edit
  def edit
    @photo_set = PhotoSet.find(params[:id])
  end

  # POST /photo_sets
  # POST /photo_sets.xml
  def create
    @photo_set = PhotoSet.new(params[:photo_set])

    respond_to do |format|
      if @photo_set.save
        flash[:notice] = 'PhotoSet was successfully created.'
        format.html { redirect_to(@photo_set) }
        format.xml  { render :xml => @photo_set, :status => :created, :location => @photo_set }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @photo_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photo_sets/1
  # PUT /photo_sets/1.xml
  def update
    @photo_set = PhotoSet.find(params[:id])

    respond_to do |format|
      if @photo_set.update_attributes(params[:photo_set])
        flash[:notice] = 'PhotoSet was successfully updated.'
        format.html { redirect_to(@photo_set) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_sets/1
  # DELETE /photo_sets/1.xml
  def destroy
    @photo_set = PhotoSet.find(params[:id])
    @photo_set.destroy

    respond_to do |format|
      format.html { redirect_to(photo_sets_url) }
      format.xml  { head :ok }
    end
  end
end
