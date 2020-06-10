class SongsController < ApplicationController

    get '/songs' do
      @songs = Song.all
      erb :'/songs/index'  
    end

    get '/songs/new' do 
      @genres = Genre.all
      erb :'/songs/new'
    end

    post '/songs' do 
      binding.pry
      @artist = Artist.find_or_create_by(name: params[:artist][:name])
      @song =  Song.create(name: params[:song][:name], :artist => @artist)
      #@owner = Owner.create(params[:owner])
      if !params[:song][:genre_ids].empty?
        params[:song][:genre_ids].each do |genre_id|
          @song.genres << Genre.find_or_create_by(id: genre_id)
        end
      end
      redirect "songs/#{@song.id}"
    end
  
    get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      erb :'/songs/show' 
    end  
  
  end
  