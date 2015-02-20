class RestaurantsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @restaurants = Restaurant.all
    @signed_in_user = current_user
  end

  def new
  	@restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
     @restaurant = Restaurant.find(params[:id])
  end

  def update
  	@restaurant = Restaurant.find(params[:id])
  	@restaurant.update(restaurant_params)

  	redirect_to '/restaurants'
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    if current_user.id == @restaurant.user_id
      @restaurant.destroy
      flash[:notice] = 'Restaurant deleted successfully'
      redirect_to '/restaurants'
    else
      flash[:notice] = 'Cannot delete restaurants you have not created'
      redirect_to '/restaurants'
    end
  end

  # def correct_user
  #   if current_user == @restaurant.user
  #     puts (current_user)
  #     puts (@restaurant.user)
  #     @restaurant = Restaurant.find(params[:id])
  #   else 
  #     redirect_to '/restaurants'
  #   end
  # end

end
