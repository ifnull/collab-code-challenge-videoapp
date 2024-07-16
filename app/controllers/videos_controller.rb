class VideosController < ApplicationController
  def index
    if params[:search].present?
      @videos = Video.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(10)
    else
      @videos = Video.page(params[:page]).per(10)
    end
  end
end
