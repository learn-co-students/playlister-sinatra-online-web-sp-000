require 'pry'
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do

    @artists = Artist.all
    @genres = Genre.all

    erb :'/songs/new'

  end

  post '/songs' do

    existing_artist = Artist.exists?(name: params["artist"]["name"])
    existing_genre = Genre.exists?(name: params["genre"]["name"])

    if !params["artist"]["name"].empty? && !existing_artist
      artist = Artist.create(params["artist"])
      @song = Song.create(name: params["song"]["name"], artist: artist)
    else
      @song = Song.create(name: params["song"]["name"])
    end

    if !params["genre"]["name"].empty? && !existing_artist
      genre = Genre.create(params["genre"])
      @song.genres << genre
    end

    @song.save

    redirect to "/songs/#{@song.slug}"

  end

  get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end


end
