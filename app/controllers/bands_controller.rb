class BandsController < ApplicationController
  before_action :verify_logged_in

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      flash[:notice] = "Congratulations on creating #{@band.name}'s page!"
      redirect_to @band
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
  end

  def index
    @bands = Band.all
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
