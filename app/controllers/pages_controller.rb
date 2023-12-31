class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @user = current_user
    @review = Review.new
    @talents = @user.talents
    @booked_talent = @user.bookings.includes(:talent).map(&:talent)
  end
end
