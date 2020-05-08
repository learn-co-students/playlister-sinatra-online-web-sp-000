require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController

  use Rack::Flash

  # This should present the user with a list of all songs in the library.
  # Each song should be a clickable link to that particular song's show page.
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    erb :'/songs/new'
  end

  # Any given song's show page should have links to that
  # song's artist and each genre associated with the song.
  get '/songs/:slug' do
    @songs = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  # Be able to change everything about a song,
  # including the genres associated with it and its artist
  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.artist = @artist
    @song.genres = []
    genres = params[:genres].collect {|id| @song.genres << Genre.find_by_id(id)}
    @song.save

    flash[:message] = "Successfully updated song."

    redirect "songs/#{@song.slug}"
  end
end
