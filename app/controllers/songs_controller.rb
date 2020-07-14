require 'rack-flash'

class SongsController < ApplicationController

    configure do
        
        enable :sessions
        use Rack::Flash
    end
    
    get '/songs' do
        @songs = Song.all
        erb :songs
    end

    get '/songs/new' do
        erb :songs_new
    end

    post '/songs' do
        @song = Song.create(name: params[:Name])
        @artist = Artist.find_or_create_by(name: params[:artist_name])
        @song.artist = @artist
        @song.genres << Genre.find(params[:genre][:id])
        @song.save
        #binding.pry
        flash[:message] = "Successfully created song."
        redirect to "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        #binding.pry
        @song = Song.find_by_slug(params[:slug])
        erb :song_show
    end

    get '/songs/:slug/edit' do
        #binding.pry
        @song = Song.find_by_slug(params[:slug])
        erb :songs_edit
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        #binding.pry
        if params[:artist_name] == ""
        else
            @artist = Artist.find_or_create_by(name: params[:artist_name])
            @song.artist = @artist
        end
            
        @song.genres << Genre.find(params[:genre][:id])
        
        @song.save
        
        flash[:message] = "Successfully updated song."
        redirect to "/songs/#{@song.slug}"
    end
end
