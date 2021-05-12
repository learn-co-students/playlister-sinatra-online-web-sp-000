class ArtistsController < ApplicationController

    get '/artists' do
        erb :'artists/index'
    end

    get '/artists/:slug' do
        @artist = Artist.find_by_slug(params[:slug])
        @songs = @artist.songs
        @genres = []
        @songs.each do |song|
            song_genres = SongGenre.where(song_id: song.id)
            song_genres.each do |song_genre|
                @genres << Genre.find(song_genre.genre_id)
            end
        end
        erb :'artists/show'
    end

end
