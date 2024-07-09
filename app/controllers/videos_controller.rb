class VideosController < ApplicationController
  include HTTParty
  base_uri MOCK_YOUTUBE_API_CONFIG['base_uri']

  def index
    @videos = fetch_videos(params[:page] || 1)
  end

  def search
    @videos = fetch_videos(params[:page] || 1, params[:query])
    render :index
  end

  private

  def fetch_videos(page, query = nil)
    options = { query: { page: page } }
    options[:query][:query] = query if query.present?
    response = self.class.get('/videos', options)
    response.parsed_response['videos'].each do |video_data|
      Video.find_or_create_by(video_id: video_data['video_id']) do |video|
        video.title = video_data['title']
        video.views = video_data['views']
        video.description = video_data['description']
        video.thumbnail_url = video_data['thumbnail_url']
      end
    end
    Video.all
  end
end
