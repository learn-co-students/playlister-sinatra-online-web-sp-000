class SongsController < ApplicationController

    get '/songs' do 
        @songs = Song.all 
        erb :"songs/index"
    end 

    get '/songs/new' do 
        @artists = Artist.all 
        erb :"songs/new"
    end

    post '/songs' do
        @song = Song.create(name: params[:song]) 
        @song.artist = Artist.create(name: params[:artist])
        redirect to "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        erb :"songs/show"
    end 

    get '/songs/:slug/edit' do 
    end

    patch '/songs/:slug' do 
    end
    
end
