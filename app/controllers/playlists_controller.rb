class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new
    @songs = Song.all
  end

  def edit
    @playlist = Playlist.find(params[:id])
    @songs = Song.all
  end

  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      redirect_to @playlist
    else
      render :new
    end
  end

  def update
    @playlist = Playlist.find(params[:id])

    if @playlist.update(playlist_params)
      flash.notice = "Playlist '#{@playlist.name}' Updated!"
      redirect_to @playlist
    else
      render :edit
    end
  end

private

def playlist_params
  params.require(:playlist).permit(:name, song_ids: [] )
end

end
