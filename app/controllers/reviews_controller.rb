class ReviewsController <ApplicationController

	before_action :authenticate_user!, :except => [:index, :show]

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.new
	end

	def create
		correct_user!
	  @restaurant = Restaurant.find(params[:restaurant_id])
	  @restaurant.reviews.create(review_params)
	  redirect_to restaurants_path
	end

	def review_params
	  params.require(:review).permit(:thoughts, :rating)
	end

	def right_user?
	  current_user.id == params[:review_id]
	end

	def correct_user!
		unless right_user?
			flash[:notice] = "nope"
	  end
  end

end