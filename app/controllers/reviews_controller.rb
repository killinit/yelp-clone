class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.reviews << Review.create(params[:review].permit(:name, :body, :ratings))
    
    redirect_to @restaurant
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews.find(params[:id])
    @reviews.update(params[:review].permit(:name, :body, :ratings))

    redirect_to @restaurant
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews.find(params[:id])
    @reviews.destroy
    redirect_to @restaurant
  end
end
