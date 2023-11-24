class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to talents_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    raise
  end
  def update
    if @user.update(user_params)
      raise
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to talents_path, status: :see_other
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :sex, :date_of_birth, :phone, :description, :address, :profile_picture)
  end
end
