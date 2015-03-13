class TracksController < ApplicationController
  def new
    @albums = Album.all
    @album = Album.find(params[:album_id])
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      flash[:notice] = "You've successfully created #{ @track.name }"
      redirect_to @track
    else
      @albums = Album.all
      @album = @track.album
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
  end

  private

  def track_params
    params.require(:track).permit(:name, :album_id, :lyrics, :track_type)
  end
end
