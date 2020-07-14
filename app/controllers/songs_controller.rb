require 'pry'
require 'rack-flash'

class SongsController < ApplicationController

    enable :sessions
    use Rack::Flash

    get '/songs' do 
        @songs = Song.all 

        erb :'songs/index'
    end

    get '/songs/new' do 
        erb :'songs/new'
    end

    post '/songs' do 
      @new_song = Song.create(name: params["Name"])
      params["genres"].each do |id|
        @new_song.genres << Genre.find_by(id: id.to_i)
      end
        if !params["artist"]["name"].empty?
            if Artist.find_by(name: params["artist"]["name"])
                @new_song.artist = Artist.find_by(name: params["artist"]["name"])
                @new_song.save
            else
                @new_song.artist = Artist.create(name: params["artist"]["name"])
                @new_song.save
            end
        end 
        flash[:message] = "Successfully created song."
        redirect "songs/#{@new_song.slug}"
    end

    get '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    get '/songs/:slug/edit' do 
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :'songs/edit'
    end

    patch '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        @song.update(name: params["Name"])
        if Artist.find_by(name: params["Artist Name"])
            @song.artist = Artist.find_by(name: params["Artist Name"])
        else
            @song.artist = Artist.create(name: params["Artist Name"])
        end
        @song.genres.clear
        params["genres"].each do |genre|
            @song.genres << Genre.find_by(name: genre)
        end
        @song.save
        flash[:message] = "Successfully updated song."
        redirect "songs/#{@song.slug}"
    end




end