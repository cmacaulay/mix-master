class Song < ApplicationRecord
  validates :title, presence: true
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :songs 
end
