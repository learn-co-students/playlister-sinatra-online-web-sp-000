class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :songs_genres
    has_and_belongs_to_many :artists
end