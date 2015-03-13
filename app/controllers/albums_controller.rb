class AlbumsController < ApplicationController
  before_action :verify_logged_in

  def new
    @bands = Band.all
    @band = Band.find(params[:band_id])
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:notice] = "You've successfully created #{ @album.name }"
      redirect_to @album
    else
      @bands = Band.all
      @band = Band.find(@album.band_id)
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id, :recording_type)
  end
end
