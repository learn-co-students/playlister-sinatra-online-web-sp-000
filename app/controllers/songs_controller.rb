class SongsController < ApplicationController

    get '/songs' do 
        @songs = Song.all 
        erb :"songs/index"
    end 

    get '/songs/new' do 
        @artists = Artist.all 
        @genres = Genre.all
        erb :"songs/new"
    end

    post '/songs' do
        # binding.pry
        puts params
        @song = Song.create(name: params["song"]) 
        if !params["artist"]["name"].empty?
            @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
        end 
        @song.save
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
