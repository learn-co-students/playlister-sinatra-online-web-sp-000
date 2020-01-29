require 'rack-flash'

class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs/new' do
    song = Song.create(name: params[:name])

    artist = Artist.find_by(name: params[:artist_name])
    artist = Artist.create(name: params[:artist_name]) if !artist
    song.artist = artist

    if params[:genre_name].empty?
      params[:genres].each do |genre_id|
        song.genres << Genre.find(genre_id)
      end
    end

    if !params[:genre_name].empty?
      song.genres << Genre.create(name: params[:genre_name])
    end

    song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  post '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    artist = Artist.find_by(name: params[:artist_name])
    artist = Artist.create(name: params[:artist_name]) if !artist
    song.artist = artist

    song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/edit"
  end

end
