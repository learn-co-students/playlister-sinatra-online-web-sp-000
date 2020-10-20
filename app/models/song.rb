class Song < ActiveRecord::Base
  has_one :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end
