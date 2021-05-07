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
        
        if Artist.find_by(:name => params[:song][:artist])
            artist = Artist.find_by(:name => params[:song][:artist])
        else
            artist = Artist.create(:name => params[:song][:artist])     
        end
        @song.artist = artist

        genres = params[:song][:genres]
        genres.each do |g|
            @song.genres << Genre.find(g)
        end

        @song.save

        flash[:message] = "Successfully created song."
        redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
         @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
        # binding.pry
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/edit'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.name = params[:name]

        @song.artist = Artist.find_or_create_by(:name => params[:artist])

        genres = params[:song][:genres]
        genres.each do |g|
            @song.genres << Genre.find(g)
        end
        @song.save

        flash[:message] = "Successfully updated song."
        redirect "songs/#{@song.slug}"        
    end
end