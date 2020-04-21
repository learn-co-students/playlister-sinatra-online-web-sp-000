require 'sinatra/base'
require "rack-flash"

class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash 

    get "/songs" do 
        @songs = Song.all
        erb :'songs/index' 
    end

    get "/songs/new" do 
        @artists = Artist.all
        erb :"songs/new"
    end

    post "/songs" do 
        
        @song = Song.create(name: params[:song][:name])
        if params[:song][:artist][:name].empty?
            @artist = Artist.find_by_id(params[:artist][:id])
        else
            if !!Artist.find_by(name: params[:song][:artist][:name])
                @artist = Artist.find_by(name: params[:song][:artist][:name])
            else
                @artist = Artist.create(name: params[:song][:artist][:name])
            end
        end
        genres = params[:genres]

        if !params[:genre][:name].empty?
            @genre = Genre.create(name: params[:genre][:name])
            genres << @genre.id
        end
        
        genres.each do |genre| 
            @song.genres << Genre.find_by_id(genre.to_i)
            @song.save
        end
    
        @artist.songs << @song
        @song.artist = @artist
        @song.save
        
        flash[:message] = "Successfully created song."
        redirect :"songs/#{@song.slug}"
    
    end

    get "/songs/:slug" do 
        @song = Song.find_by_slug(params[:slug])
        @artist = @song.artist
        erb :'songs/show'
    end

    get "/songs/:slug/edit" do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end

    patch "/songs/:slug/edit" do
        @song = Song.find_by_slug(params[:slug])
        @artist = Artist.find_by(name: params[:artist][:name]) || Artist.create(name: params[:artist][:name])
        @genres = params[:genres]
        
        genres = []
        @genres.each do |genre| 
            g = Genre.find_by(name: genre)
            genres << g
        end
        @song.update(genres: genres)
        
        @artist.songs << @song

        
        flash[:message] = "Successfully updated song."
        
        redirect :"songs/#{params[:slug]}"
        
    end
end