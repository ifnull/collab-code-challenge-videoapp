class PlaylistsController < ApplicationController
  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      redirect_to @playlist, notice: 'Playlist created successfully.'
    else
      render :new
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def add_video
    @playlist = Playlist.find(params[:id])
    video = Video.find(params[:video_id])
    @playlist.videos << video
    redirect_to @playlist, notice: 'Video added to playlist.'
  end

  def remove_video
    @playlist = Playlist.find(params[:id])
    video = @playlist.videos.find(params[:video_id])
    @playlist.videos.delete(video)
    redirect_to @playlist, notice: 'Video removed from playlist.'
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
