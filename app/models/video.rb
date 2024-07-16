class Video < ApplicationRecord
  has_many :playlist_videos, class_name: 'PlaylistVideo'
  has_many :playlists, through: :playlist_videos
end
