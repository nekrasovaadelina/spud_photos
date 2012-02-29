class Spud::Admin::PhotosController < Spud::Admin::ApplicationController

  before_filter :get_photo, :only => [:show, :edit, :update, :destroy]
  layout 'spud/admin/photos'
  respond_to :html, :json, :xml

  add_breadcrumb 'Photos', :spud_admin_photos_path
  belongs_to_spud_app :photos

  def index
    @photos = SpudPhoto.all
    respond_with @photos
  end

  def show
    respond_with @photo
  end

  def new
    @photo = SpudPhoto.new
    respond_with @photo
  end

  def create
    @photo = SpudPhoto.new(params[:spud_photo])
    flash[:notice] = 'SpudPhoto created successfully' if @photo.save
    respond_with @photo, :location => spud_admin_photos_path
  end

  def edit
    respond_with @photo
  end
  
  def update
    @photo.update_attributes(params[:spud_photo])
    flash[:notice] = 'SpudPhoto updated successfully' if @photo.save
    respond_with @photo, :location => spud_admin_photos_path
  end
  
  def destroy
    flash[:notice] = 'SpudPhoto deleted successfully' if @photo.destroy
    respond_with @photo, :location => spud_admin_photos_path
  end

  def get_photo
    @photo = SpudPhoto.find(params[:id])
  end
  
end