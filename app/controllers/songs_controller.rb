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

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    artist = Artist.find_by(name: params["Artist Name"])
    if !artist
      artist = Artist.create(name: params["Artist Name"])
    end
    artist.songs << @song
    if params["genres"]
    params["genres"].each do |genre_id|
      genre = Genre.find_by(id: genre_id)
      genre.songs << @song
      @song.genres << genre
    end
    end
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    artist = Artist.find_by(name: params["Artist Name"])
    if !artist
      artist = Artist.create(name: params["Artist Name"])
    end
  
    song.update(artist_id: artist.id)
    song.update(genre_ids: params["genres"])
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{song.slug}"
  end


end
