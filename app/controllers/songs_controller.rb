class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :"/song/index"
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :"/song/new"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :"/song/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :"/song/edit"
  end

  post '/songs' do
    song = Song.new()
    song.name = params["Name"]
    song.save
    artist = Artist.find_by(name: params["artist_name"])
    if artist && params["artist_name"] != ""
      artist.songs << song
    elsif params["Artist Name"] != ""
      artist = Artist.create(name: params["artist_name"])
      artist.songs << song
    end
    song.genre_ids = params[:genres]
    redirect :"/songs/#{song.slug}"
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    artist = Artist.find_by(name: params["artist_name"])
    if !artist && params["artist_name"] != ""
      artist = Artist.create(name: params["artist_name"])
      artist.songs << song
    end
    song.update(name: params["Name"])
    redirect :"/songs/#{song.slug}"
  end

  delete '/songs/:slug' do

  end
end
