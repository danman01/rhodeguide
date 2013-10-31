class KeyDistancesController < ApplicationController
  def index
    @key_locations = KeyLocation.all
  end

  def show
    @key_location = KeyLocation.find(params[:id])
  end

  def new
    @key_location = KeyLocation.new
  end

  def create
    @key_location = KeyLocation.new(location_params)
    if @key_location.save
      redirect_to @key_location, :notice => "Successfully created key location."
    else
      render :action => 'new'
    end
  end

  def edit
    @key_location = KeyLocation.find(params[:id])
  end

  def update
    @key_location = KeyLocation.find(params[:id])
    if @key_location.update_attributes(location_params)
      redirect_to @key_location, :notice  => "Successfully updated key location."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @key_location = KeyLocation.find(params[:id])
    @key_location.destroy
    redirect_to key_locations_url, :notice => "Successfully destroyed key location."
  end

  private

  def location_params
    params.require(:key_location).permit(:location_id)
  end
end
