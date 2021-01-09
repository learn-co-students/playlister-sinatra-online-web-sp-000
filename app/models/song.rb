class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genre, through: :song_genre

end