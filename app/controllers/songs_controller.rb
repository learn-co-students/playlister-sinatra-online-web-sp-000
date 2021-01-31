require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all

    erb :'songs/new'
  end

  post '/songs' do
    song = Song.new(name: params[:song][:name])
    artist = Artist.find_or_create_by(name: params[:artist][:name])
    song.artist = artist

    song.genres = Genre.where(name: params[:genres])

    if song.save
      flash[:message] = "Successfully created song."

      redirect "/songs/#{song.slug}"
    end
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.genres = []

    song.update(name: params[:song][:name])

    song.genres = Genre.where(id: params[:song][:genres])

    artist = Artist.find_or_create_by(name: params[:artist][:name])
    song.artist = artist

    if song.save
      flash[:message] = "Successfully updated song."
      redirect "/songs/#{song.slug}"
    end

  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    @success_message = session[:success_message]
    session[:success_message] = nil

    erb :'songs/show'
  end
end
