class KeyDistancesController < ApplicationController
  def index
    @key_distances = KeyDistance.all
  end

  def show
    @key_distance = KeyDistance.find(params[:id])
  end

  def new
    @key_distance = KeyDistance.new
  end

  def create
    @key_distance = KeyDistance.new(location_params)
    if @key_distance.save
      redirect_to @key_distance, :notice => "Successfully created key location."
    else
      render :action => 'new'
    end
  end

  def edit
    @key_distance = KeyDistance.find(params[:id])
  end

  def update
    @key_distance = KeyDistance.find(params[:id])
    if @key_distance.update_attributes(location_params)
      redirect_to @key_distance, :notice  => "Successfully updated key location."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @key_distance = KeyDistance.find(params[:id])
    @key_distance.destroy
    redirect_to key_distances_url, :notice => "Successfully destroyed key location."
  end

  private

  def location_params
    params.require(:key_distance).permit(:location_id)
  end
end
