class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all

  end

  def show
    @restaurant = Restaurant.find(params[:id])

  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(get_restaurant_info)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def get_restaurant_info
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
