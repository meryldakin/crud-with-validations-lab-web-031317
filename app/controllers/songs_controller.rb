class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(:title, :artist_name, :genre, :released, :release_year))
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end


  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params(:title, :artist_name, :genre, :released, :release_year))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  def show
    @song = Song.find(params[:id])
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end
end
