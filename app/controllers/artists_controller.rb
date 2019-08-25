class ArtistsController < ApplicationController
  before_action :set_board
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = @board.artists
  end

  def show
  end

  def new
    @artist = @board.artists.new
  end
  
  def create
    @artist = @board.artists.new(artist_params)
    
    if @artist.save
      redirect_to [@board, @artist]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @artist.update(artist_params)
      redirect_to [@board, @artist]
    else 
      redirect_to board_artists_path
    end
  end

  def destroy
    @artist.destroy
    redirect_to board_artists_path
  end

  private

    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :genre)
    end

end
