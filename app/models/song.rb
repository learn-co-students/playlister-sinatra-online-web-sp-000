class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres
    def remove_genre(genre)
        self.song_genres.find_by(genre_id: genre.id).destroy
    end
end