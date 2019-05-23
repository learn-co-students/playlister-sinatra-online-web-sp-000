class SongsController < ApplicationController
  use Rack::Flash
  
  get '/songs' do 
    @songs = Song.all

    erb :'songs/index'
  end
  
  get '/songs/new' do 
    erb :'songs/new'
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    
    erb :'songs/show'
  end
  
  post '/songs' do
    @song = Song.new(name: params["song"]["name"])
    params["song"]["genre_ids"].each do |genre_id|
      @song.genres << Genre.find(genre_id)
    end
    @song.artist = Artist.find_or_create_by(name: params["song"]["artist"]["name"])
    @song.save
    
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end
  
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    
    erb :'songs/edit'
  end
  
  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if !(params["artist_name"] == "")
      @song.artist = Artist.find_or_create_by(name: params["artist_name"])
    end
    @song.genres.clear
    if !params["genre_ids"].empty?
      params["genre_ids"].each do |genre_id|
        @song.genres << Genre.find(genre_id)
      end
    end
    @song.save
    
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
end