class SongsController < ApplicationController
    
    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/new' do
        @artists = Artist.all
        @genres = Genre.all
        erb :'/songs/new'
    end

    post '/songs' do
        @song = Song.create(name: params[:name])
        artist_name = params[:song][:artist_name]
        if artist_name != nil
            @artist = Artist.find_by(name: artist_name)
            @artist ||= Artist.create(name: artist_name)
        end
        @song.artist = @artist
        genre_name = params[:song][:genre_name]
        if genre_name != nil
            @genre = Genre.find_by(name: genre_name)
            @genre ||= Genre.create(name: genre_name)
            @song.genres << @genre
        end
        @song.save
        redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @artists = Artist.all
        @genres = Genre.all
        @song_genre_ids = @song.genres.collect do |genre|
            genre.id
        end
        erb :'/songs/edit'
    end
    
    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        artist_name = params[:song][:artist_name]
        if artist_name != nil && artist_name != ""
            @artist = Artist.find_by(name: artist_name)
            @artist ||= Artist.create(name: artist_name)
            @song.artist = @artist
        end
        genre_name = params[:song][:genre_name]
        if genre_name != nil
            @genre = Genre.find_by(name: genre_name)
            @genre ||= Genre.create(name: genre_name)
            @song.genres = [@genre]
        end
        @song.save
        redirect "/songs/#{@song.slug}"
    end

end
