class Helper
    def self.genre_for_song(song)
        genre = Genre.find(SongGenre.find_by(song_id: song.id).genre_id)
    end
end