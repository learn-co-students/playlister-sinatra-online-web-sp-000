require 'rack-flash'

class SongsController < ApplicationController
    use Rack::Flash

    get '/songs' do
      #binding.pry
      @songs = Song.all
      erb :'/songs/index'  
    end

    get '/songs/new' do 
      @genres = Genre.all
      erb :'/songs/new'
    end

    post '/songs' do 
      @artist = Artist.find_or_create_by(name: params[:artist][:name])
      @song =  Song.create(name: params[:song][:name], :artist => @artist)
      #@owner = Owner.create(params[:owner])
      if !params[:song][:genre_ids].empty?
        params[:song][:genre_ids].each do |genre_id|
          @song.genres << Genre.find_or_create_by(id: genre_id)
        end
      end
      flash[:message] = "Successfully created song."
      redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug/edit' do 
      @song = Song.find_by_slug(params[:slug])
      @genres = Genre.all
      erb :'/songs/edit'
    end
  
    get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      erb :'/songs/show' 
    end  

    patch '/songs/:slug' do 
      @song = Song.find_by_slug(params[:slug])
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
      @song.update(name: params[:song][:name])
      @song.genres = []
      if !params[:song][:genre_ids].empty?
        params[:song][:genre_ids].each do |genre_id|
          @song.genres << Genre.find_or_create_by(id: genre_id)
        end
      end
      @song.save
      flash[:message] = "Successfully updated song."
      redirect "/songs/#{@song.slug}"
    end    
  
  end
  