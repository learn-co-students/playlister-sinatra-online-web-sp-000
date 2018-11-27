require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do
    artist = Artist.find_or_create_by(name: params[:song][:artist_name])
    genres = params[:song][:genre_slugs].map { |slug| Genre.find_by_slug(slug) }
    song = Song.create(genres: genres, artist: artist, name: params[:song][:name])
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/create'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  put '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.artist = Artist.find_or_create_by(name: params[:song][:artist_name])
    genres = params[:song][:genre_slugs].map { |slug| Genre.find_by_slug(slug) }
    song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{params[:slug]}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end
end
