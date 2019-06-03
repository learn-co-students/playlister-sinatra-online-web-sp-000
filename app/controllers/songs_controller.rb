require 'rack-flash'

class SongsController < ApplicationController
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
    song = Song.new(name: params[:song_name])
    params[:genres].each do |id|
      song.genres << Genre.find(id)
    end
    if song.artist = Artist.find_by(name: params[:artist_name])
      song.save

    else
      song.artist = Artist.create(name: params[:artist_name])
      song.save

    end
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    @song.update(name: params[:song_name])

    @song.genres = params[:genres].map do |id|
      Genre.find(id)
    end

    @song.artist = Artist.find_or_create_by(name: params[:artist_name])

    @song.save
    
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end


end
