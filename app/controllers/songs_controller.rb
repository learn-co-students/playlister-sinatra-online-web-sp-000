require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'/songs/new'
    end

    post '/songs' do 
        @song = Song.create(:name => params[:song][:name])
        
        submitted_artist = params[:artist][:name]
        if Artist.find_by(:name => submitted_artist)
            artist = Artist.find_by(:name => submitted_artist)
        else 
            artist = Artist.create(:name => submitted_artist)
        end
        @song.artist = artist
        
        desired_genres = params[:genres][:name]
        desired_genres.each do |genre| 
            @song.genres << Genre.find_by(:name => genre)
        end 
        
        @song.save 

        flash[:message] = "Successfully created song."
        
        redirect to "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])

        erb :'/songs/edit'
    end

    patch '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])

        artist = params[:song][:artist]
        artist_object = Artist.find_by(:name => artist)
        @song.artist = artist_object
        
        if @song.genres 
            @song.genres.clear 
        end
        genres = params[:song][:genres]
        genres.each do |genre| 
            @song.genres << Genre.find_by(:name => genre)
        end 

        @song.save
        flash[:message] = "Successfully updated song."
        erb :'/songs/show'
    end

end