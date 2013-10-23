class LocationsController < ApplicationController
  def index
    if params[:search].present?
      @locations = Location.near(params[:search], 5, :order => :distance_to_key)
    else
      @locations = Location.all
    end
  end

  def show
    @location = Location.find(params[:id])
    @locations = [@location]
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
    params.require(:location).permit(:address,:latitude,:longitude,:beds,:baths,:price,:phone,:name,:notes,:neighborhood,:taxes,:link)
  end
end
