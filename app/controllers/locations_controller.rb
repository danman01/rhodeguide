class LocationsController < ApplicationController
  before_filter :authenticate_user!,:only=>[:new,:create,:edit,:update,:destroy]

  def index
    @show_map = true
    if current_user
      @groups = current_user.groups
      if params[:group]
        @group = Group.find_by(id: params[:group])
      else
        @group = nil
      end
      if params[:search].present?
        @locations = current_user.locations.near(params[:search], 5, :order => :distance_to_key)
      else
        if @group
          @locations = @group.locations
        else
          @locations = current_user.locations
        end
        
      end

    else
      @locations = Location.all
    end
    @key_locations = @locations.where(:is_key => true)
  end

  def show
    @show_map = true
    @location = Location.find(params[:id])
    @locations = [@location]
    @groups = current_user.groups rescue nil
    @group = @location.group
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to @location, :notice => "Successfully created location."
    else
      render :action => 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])
    @locations = [@location]
    
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes!(location_params)
      redirect_to @location, :notice  => "Successfully updated location."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_url, :notice => "Successfully destroyed location."
  end

  private

  def location_params
    params.require(:location).permit({:images_attributes => [:id, :url,:_destroy]}, :group_id, :user_id,:is_key,:address,:latitude,:longitude,:beds,:baths,:price,:phone,:name,:notes,:neighborhood,:taxes,:link)
  end
end
