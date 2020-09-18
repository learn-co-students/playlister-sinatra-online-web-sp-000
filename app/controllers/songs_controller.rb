require "rack-flash"

class SongsController < ApplicationController
    use Rack::Flash
    get '/songs' do 
        @songs = Song.all 
        erb :"songs/index"
    end 

    get '/songs/new' do 
        # Genre.create(name: "Hippity Hop")
        # Genre.create(name: "New Age Garbage")
        @artists = Artist.all 
        @genres = Genre.all
        erb :"songs/new"
    end

    post '/songs' do
        # puts params
        # binding.pry
        @song = Song.create(params[:song]) 
       
        if !params["artist"]["name"].empty?
            @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        end 
        @song.genre_ids = params[:genres]
        @song.save
        # binding.pry
        flash[:message] = "Successfully created song."
        redirect to "/songs/#{@song.slug}"
        # erb :"songs/new"
    end

    get '/songs/:slug/edit' do 
        @song = Song.find_by_slug(params[:slug])
        @artists = Artist.all
        @genres = Genre.all
        # @artist = Artist.find(@song.artist_id)
        # binding.pry
        
        erb :"songs/edit"
    end

    get '/songs/:slug' do 
        # puts params
        @song = Song.find_by_slug(params[:slug])
        puts @song.artist.name
        erb :"songs/show"
    end 

    
    patch '/songs/:slug' do 
        # binding.pry
        # puts params
        
        @song = Song.find_by_slug(params[:slug])

        params[:song][:name] = @song.name
        params[:song][:artist] = @song.artist

        !params["artist"]["name"].empty? ? params[:song][:artist] = Artist.find_or_create_by(name: params[:artist][:name]) : params[:song][:artist] = @song.artist
        # puts params
        @song.update(params["song"])
        @song.genre_ids = params[:song][:genre_ids]
        @song.save
        flash[:message] = "Successfully updated song."
        redirect to "/songs/#{@song.slug}"
    end
    
end