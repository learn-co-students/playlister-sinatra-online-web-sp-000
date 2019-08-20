require 'rack-flash'
class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash
  
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end
  
  post '/songs' do
    @song = Song.create(params[:name])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre = params[:genres]
    @song.save
    
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end
  
  get '/songs/new' do
    @songs = Song.all
    @genres = Genre.all
    erb :'/songs/new'
  end
  
  get '/songs/:slug/edit' do
    @song = Song.find(params[:slug])
    @genres = Genre.all
    erb:'songs/edit'
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end
  
  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.update(params["song"])
    
    flash[:message] = "Succesfully updated song." 
    redirect "/songs/#{@song.slug}"
  end
end