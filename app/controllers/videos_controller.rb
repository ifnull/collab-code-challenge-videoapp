class VideosController < ApplicationController
  include HTTParty
  base_uri MOCK_YOUTUBE_API_CONFIG['base_uri']

  def index
    puts "Fetching videos for page #{params[:page]}"
    @videos, @total_pages = fetch_videos(params[:page] || 1)
    puts "Fetched #{@videos.count} videos"
  end

  def search
    puts "Searching for videos with query #{params[:query]}"
    @videos, @total_pages = fetch_videos(params[:page] || 1, params[:query])
    puts "Fetched #{@videos.count} videos"
    render :index
  end

  private

  def fetch_videos(page, query = nil)
    puts "Fetching videos from API"
    options = { query: { page: page } }
    options[:query][:query] = query if query.present?
    response = self.class.get('/videos', options)
    total_pages = (response.parsed_response['meta']['total'] / 10.0).ceil
    videos = response.parsed_response['videos'].map do |video_data|
      Video.find_or_create_by(video_id: video_data['video_id']) do |video|
        video.title = video_data['title']
        video.views = video_data['views']
        video.description = video_data['description']
        video.thumbnail_url = video_data['thumbnail_url']
      end
    end
    puts "Fetched #{videos.count} videos from API"
    [videos, total_pages]
  end
end
