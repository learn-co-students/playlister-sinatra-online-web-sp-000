require 'rack-flash'

class SongsController < ApplicationController

    enable :sessions
    use Rack::Flash
    
    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        @artists = Artist.all
        @genres = Genre.all
        erb :'songs/new'
    end

    post '/songs' do
        @song = Song.create(params[:song])
        @song.genre_ids = params[:genres]

        if !params["artist"]["name"].empty?
            @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
        else
            @song.artist = Artist.find(params["song"]["artist_id"])
        end

        @song.save

        flash[:message] = "Successfully created song."
        redirect to "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @artists = Artist.all
        @genres = Genre.all

        erb :'songs/edit'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        @song.genre_ids = params[:genres]

        if !params["artist"]["name"].empty?
            @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
        else
            @song.artist = Artist.find(params["song"]["artist_id"])
        end

        @song.save

        flash[:message] = "Successfully updated song."
        
        redirect to "/songs/#{@song.slug}"
    end

end