class SongsController < ApplicationController
    get '/songs' do
        @songs = Song.all

        erb :'songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all

        erb :'songs/new'
    end

    post '/songs' do
        song = Song.new
        song.name = params[:song_name]
        song.slug = Slugify.slug(params[:song_name])
        params[:genres].each do |genre_id| 
            song.genres << Genre.find(genre_id)
        end
        song.artist = Artist.find_or_create_by(name: params[:song_artist], slug: Slugify.slug(params[:song_artist]))
        song.save
         
        redirect "songs/#{song.slug}"
    end

    get '/songs/:slug/edit' do
        @song = Slugify.find_by_slug(Song, params[:slug])
        @genres_all = Genre.all
        song_genres = SongGenre.where(song_id: @song.id)
        @genres = song_genres.collect{|song_genre| Genre.find(song_genre.genre_id)}

        erb :'songs/edit'
    end

    patch '/songs/:slug' do
        @song = Slugify.find_by_slug(Song, params[:slug])
        @song.name = params[:song_name]
        @song.slug = Slugify.slug(params[:song_name])
        @song.genres.clear
        params[:genres].each do |genre_id| 
            @song.genres << Genre.find(genre_id)
        end
        @song.artist = Artist.find_or_create_by(name: params[:song_artist], slug: Slugify.slug(params[:song_artist]))
        @song.save

        redirect "songs/#{@song.slug}"
    end

    delete '/songs/:slug' do
        song = Slugify.find_by_slug(Song, params[:slug])
        song.delete

        redirect '/songs'
    end

    get '/songs/:slug' do
        @song = Slugify.find_by_slug(Song, params[:slug])
        song_genres = SongGenre.where(song_id: @song.id)
        @genres = song_genres.collect{|song_genre| Genre.find(song_genre.genre_id)}

        erb :'songs/show'
    end
end