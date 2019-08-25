class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, only: [:edit]
  def new
    @song = Song.new
  end

  def create
    @song = @artist.songs.new(song_params)
    if song.save 
      redirect_to board_artist_path(@artist.board_id, @artist)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to artist_songs_path(@artist)
    else
      render :new
  end

  def destroy
    @song.destroy
    redirect_to artist_songs_path
  end

    private
      def set_artist
        @artist = Artist.find(params[:artist_id])
      end

      def set_song
        @song = Song.find(params[:id])
      end

      def song_params
        params.require(:song).permit(:name)
      end
  end    
end
