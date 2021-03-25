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
    erb :'/songs/new'
  end
  
  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    artist_input = Artist.find_by(name: params[:song][:artist][:name])
    if artist_input == nil
      artist = Artist.create(params[:song][:artist])
    else
      artist = Artist.find_by(name: params[:song][:artist][:name])
    end
    @song.genres << genre = Genre.find_by(name: params[:genres])
    artist.songs << @song
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
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
    @song.artist = Artist.find_or_create_by(name: params[:song][:artist][:name])
    @song.genres =[ ]
    @song.genres << Genre.find_by(name: params[:genres])
    
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
    
end