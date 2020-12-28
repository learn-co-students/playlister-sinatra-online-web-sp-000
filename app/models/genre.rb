class Genre < ActiveRecord::Base
  has_many :artists, through: :artist_songs
  has_many :songs, through: :song_genres
end
