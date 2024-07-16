class Playlist < ApplicationRecord
  has_many :playlist_videos, class_name: 'PlaylistVideo', foreign_key: 'playlist_id'
  has_many :videos, through: :playlist_videos

  validates :name, presence: true
end
