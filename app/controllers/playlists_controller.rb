class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy, :add_video, :remove_video]

  def index
    @playlists = Playlist.all

    respond_to do |format|
      format.html
      format.json { render json: @playlists.to_json(include: :videos) }
    end
  end

  def show
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      redirect_to @playlist, notice: 'Playlist was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @playlist.update(playlist_params)
      redirect_to @playlist, notice: 'Playlist was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @playlist.destroy
    redirect_to playlists_url, notice: 'Playlist was successfully destroyed.'
  end

  def add_video
    @video = Video.find(params[:video_id])
    @playlist.videos << @video unless @playlist.videos.include?(@video)
    respond_to do |format|
      format.html { redirect_to @playlist, notice: 'Video was successfully added to playlist.' }
      format.json { head :no_content }
    end
  end

  def remove_video
    @video = Video.find(params[:video_id])
    @playlist.videos.delete(@video)
    respond_to do |format|
      format.html { redirect_to @playlist, notice: 'Video was successfully removed from playlist.' }
      format.json { head :no_content }
    end
  end

  private

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
