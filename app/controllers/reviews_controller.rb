class ReviewsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save
      redirect_to talent_path(@booking.talent)
    else
      redirect_to dashboard_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :booking_id)
  end
end
