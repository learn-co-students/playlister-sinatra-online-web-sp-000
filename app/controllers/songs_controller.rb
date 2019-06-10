class SongsController < ApplicationController
  # Rack Flash
  require 'rack-flash'
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    #binding.pry
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    song = Song.create(name: params["Name"], genre_ids: params[:genre_ids])
    artist = Artist.find_or_create_by(name: params["Artist Name"])
    song.artist = artist
    song.save
    #binding.pry
    flash[:message] = "Successfully created song."
    #binding.pry
    redirect "songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    #binding.pry
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    artist = Artist.find_or_create_by(name: params["Artist Name"])
    song = Song.find_by_slug(params[:slug])
    song.update(name: params["Name"], genre_ids: params[:genre_ids])
    song.artist = artist
    song.save
    flash[:message] = "Successfully updated song."
    #binding.pry
    redirect "songs/#{song.slug}"
  end
end
