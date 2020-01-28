require 'rack-flash'

class SongsController < ApplicationController

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
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/edit'
  end

  post '/songs' do
    @song = Song.create(params[:song]) #Takes inputs and creates a song from it.
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."
    redirect("/songs/#{@song.slug}")
  end

  patch '/songs/:slug' do #Essentially does the same thing as 'new', but instead updates just the artist name or genre.
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully updated song."
    redirect("/songs/#{@song.slug}")
  end


end
