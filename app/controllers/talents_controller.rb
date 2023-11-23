class TalentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_talent, only: %i[show edit update destroy]

  def show
    @booking = Booking.new
    @bookings = @talent.bookings
    @bookings_dates = @bookings.map do |booking|
      {
        from: booking.start_date,
        to: booking.end_date
      }
    end
    @user = @talent.user
  end

  def new
    @talent = Talent.new
  end

  def index
    @talents = Talent.all

    if params[:talent_type].present?
      @talents = @talents.where(talent_type: params[:talent_type])
    end

    if params[:query].present?
      @talents = @talents.where("working_area ILIKE ?", "%#{params[:query]}%")
    end
  end

  def create
    @talent = Talent.new(talent_params)
    @talent.user = current_user
    if @talent.save
      redirect_to talent_path(@talent)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @talent.update(talent_params)
      redirect_to talent_path(@talent)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @talent.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def set_talent
    @talent = Talent.find(params[:id])
  end

  def talent_params
    params.require(:talent).permit(:pseudo, :working_area, :talent_type, :price, :performance_duration, :description, medias: [])
  end
end
