

class SongsController < ApplicationController

    configure do
        
        enable :sessions unless test?
        
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
        @artist = Artist.create(name: params[:artist_name])
        @song.artist = @artist
        @song.genres << Genre.find(params[:genre][:id])
        @song.save
        #binding.pry
        #flash[:message] = "Successfully created song."
        redirect to "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        #binding.pry
        @song = Song.find_by_slug(params[:slug])
        erb :song_show
    end

    
end
