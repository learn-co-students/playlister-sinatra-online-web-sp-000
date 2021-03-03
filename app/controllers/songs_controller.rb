class SongsController < ApplicationController
    get '/songs' do
        @songs = Song.all 
        erb :'/songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all 
        @artists = Artist.all
        erb :'/songs/new'
    end

    post '/songs' do 
        #binding.pry
        @song = Song.create(params[:song])

            @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
            params[:genre].each do |genre|
               @song.genres << Genre.find_or_create_by(name: genre) # value for input matches with value in the controller
            end
            @song.save 
         redirect to "songs/#{@song.slug}"
    end

    get '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    get '/songs/:slug/edit' do

    end

    patch '/songs/:slug' do

    end
end