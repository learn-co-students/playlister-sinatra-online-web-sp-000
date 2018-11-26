require 'sinatra/base'
require 'sinatra/flash'

class SongsController < ApplicationController
  enable :sessions
  register Sinatra::Flash
  
  # Index action
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  # Create action
  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    song = Song.create(params[:song])
    artist_name = params[:artist][:name].chomp
    song.artist = Artist.find_by_slug(artist_name) || Artist.create(name:artist_name) unless artist_name.empty?
    song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}" 
  end

  # Show action
  get '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end 

  # Edit action

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end
  
  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    artist_name = params[:artist][:name]
    song.update(params[:song])
    song.artist = Artist.find_by_slug(artist_name) || Artist.create(name: artist_name)
    song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}" 
  end

end
