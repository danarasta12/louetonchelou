class TalentsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  before_action :set_talent, only: %i[show create edit update]

  def show
  end

  def index
    @talents = Talent.all
  end

  def create
    @user = User.find(params[:user_id])
    @talent = Talent.new(talent_params)
    @talent.user = @user
    if @talent.save
      redirect_to edit_talent_path(@talent)
    else
      render "talents/show", status: :unprocessable_entity
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
    redirect_to talents_path, status: :see_other
  end

  private

  def set_talent
    @talent = Talent.find(params[:id])
  end

  def talent_params
    params.require(:talent).permit(:pseudo, :working_area, :talent_type, :price, :performance_duration, :medias, :description, :user_id)
  end
end
