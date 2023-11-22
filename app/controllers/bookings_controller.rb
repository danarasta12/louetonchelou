class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @talent = Talent.find(params[:talent_id])
    @booking = @talent.bookings.build(booking_params)
    if @booking.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :address)
  end
end
