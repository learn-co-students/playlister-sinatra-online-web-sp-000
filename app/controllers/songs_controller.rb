class SongsController < ApplicationController

    get "/songs" do 
        @songs = Song.all
        erb :'songs/index' 
    end

    get "/songs/new" do 
        @artists = Artist.all
        erb :"songs/new"
    end

    post "/songs/new" do 
        
        @song = Song.create(name: params[:song][:name])
        if !params[:song][:artist][:name].empty?
            @artist = Artist.create(name: params[:song][:artist][:name])
        else 
            @artist = Artist.find_by_id(params[:artist][:id])
        end
        
        @artist.songs << @song
        @song.artist = @artist
        @song.save
        redirect :"songs/#{@song.slug}"
    end

    get "/songs/:slug" do 
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end
end