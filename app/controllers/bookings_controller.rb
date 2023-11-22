class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    if user_signed_in?
      @booking = Booking.new(booking_params)
      @talent = Talent.find(params[:talent_id])
      @booking.talent = @talent
      @booking.user = current_user
      if @booking.save
        redirect_to dashboard_path, notice: 'Booking was successfully created.'
      else
        # Handle validation errors or other cases where the booking couldn't be saved
        redirect_to talent_path, alert: 'Booking could not be created.'
      end
    else
      redirect_to new_user_session_path, alert: 'Please sign in to book a freak.'
    end
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :address, :talent_id)
  end
end
