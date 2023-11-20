class TalentsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @talent = Talent.find(params[:id])
  end

  def index
    @talents = Talent.new
  end
end
