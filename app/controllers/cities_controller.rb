class CitiesController < ApplicationController

before_action :find_city, only: [:show]

  def index
    @cities = City.all
    render :index
  end

  def new
    @city = City.new
  end

  def create
    @city = City.create(city_params)
    redirect_to city_path(@city)
  end

  def show
    @city = City.find_by_id(params[:id])
    @post = Post.new
    @posts = @city.posts.order("created_at desc")
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(10)
  end

  def edit
    @city = City.find_by_id(params[:id])
  end

  def update
    @city = City.find_by_id(params[:id])
    @city.update(city_params)
    redirect_to city_path(@city)
  end

  private

  def city_params
    params.require(:city).permit(:city_name, :state, :country, :city_picture, :header_picture)
  end

  def find_city
  # This assumes you have an association set up as needed
    @city = City.find_by_id(params[:id])

    if @city.nil?
      redirect_to root_path
    end
  end

end
