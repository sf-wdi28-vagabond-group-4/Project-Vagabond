class CitiesController < ApplicationController

  def index
    @cities = City.all
    render :index
  end

  def new
    @city = City.new
  end

  def create
    @city = City.create(city_params)
    redirect_to city_path
  end

  def show
    @city = City.find_by(params[:id])
  end

  private

  def city_params
    params.require(:city).permit(:city_name, :state, :country, :city_picture)
  end

end
