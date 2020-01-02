
#require 'rack-flash'

class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all 
        erb :'songs/index'
    end

    get '/songs/new' do
        #if artist exists, add song, if artist is new, add song and artist
        erb :'songs/new'
    end 

    get '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        
        erb :'songs/show'
        #song's show page has links to song's artist and genre associated with song
        #Pay attention to order here with order compared to /songs/new--slug must be defined first
    end

    post '/songs' do
        @song = Song.create(params[:song])     
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.genre_ids = params[:genres]
        @song.save 
        #this is having error! flash[:message] = "Successfully created song." 
        redirect("/songs/#{@song.slug}")
      end

    get '/songs/:slug/edit' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end

    patch '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.genre_ids = params[:genres]
        @song.save
        redirect("/songs/#{@song.slug}")
        
    end
    #will also have new and show (posts?)
end


