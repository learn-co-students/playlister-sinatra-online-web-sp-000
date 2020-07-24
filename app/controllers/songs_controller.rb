class SongsController < ApplicationController
    require "rack-flash"
    enable :sessions
    use Rack::Flash

    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    post '/songs' do
        artist = Artist.find_or_create_by(name: params[:artist_name])
        genres = params[:genres].map {|genre_id| Genre.find(genre_id)}
        new_song = Song.new(name: params["Name"], artist: artist)
        new_song.genres << genres
        new_song.save
        flash[:message] = "Successfully created song."
        redirect to "/songs/#{new_song.slug}"
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :'songs/edit'
    end

    patch '/songs/:id' do
        song = Song.find(params[:id])
        artist = Artist.find_or_create_by(name: params[:artist_name])
        genres = params[:genres].map do |genre_id|
            Genre.find(genre_id)
        end

        song.artist = artist
        song.genres = genres
        song.save

        flash[:message] = "Successfully updated song."

        redirect to "/songs/#{song.slug}"
    end



end