class Helper
    def self.new_song(params)
        song = Song.create(name: params[:song][:name])
        genres = params[:song][:genres].map do |genre_id|
            Genre.find_by(id: genre_id)
        end
        genres.each do |genre|
            song.song_genres.build(genre: genre)
        end
        artist = Artist.find_or_create_by(name: params[:song][:artist_name])
        song.artist_id = artist.id
        song.save
        song
    end

    def self.update_song(params)
        song = Song.find_by_slug(params[:slug])
        genres = params[:song][:genres].map do |genre_id|
            Genre.find_by(id: genre_id)
        end
        genres.each do |genre|
            if song.genres.size == genres.size
                song.song_genres.update(genre: genre)
            else
                song.song_genres.build(genre: genre)
            end
        end
        artist = Artist.find_or_create_by(name: params[:song][:artist_name])
        song.artist_id = artist.id
        song.save
        song
    end
end