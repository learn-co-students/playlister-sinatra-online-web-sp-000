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
    @genres = Genre.all

    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/show'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params["artist"]["name"])
    @song = Song.create(name: params["song"]["name"], artist: @artist)
    if !params["genres"].empty?
      genres = params["genres"]
      genres.each do |genre|
        SongGenre.create(song: @song, genre: Genre.find_by(name: genre))
      end
    end

    if !params["new_genre"].empty?
      new_genre = Genre.create(name: params["new_genre"])
      SongGenre.create(song: @song, genre: new_genre)
    end
    
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all

    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_or_create_by(name: params["artist"]["name"])
    @song.update(artist: @artist)
    if !params["genres"].empty?
      genres = params["genres"]
      genres.each do |genre|
        SongGenre.find_or_create_by(song: @song, genre: Genre.find(genre))
      end
    end

    if !params["new_genre"].empty?
      new_genre = Genre.create(name: params["new_genre"])
      SongGenre.create(song: @song, genre: new_genre)
    end

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
end