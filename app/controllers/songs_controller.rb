require 'rack-flash'
class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash
  set :views, Proc.new { File.join(root, "../views/songs/") }

  get '/songs' do
    @songs = Song.all

    erb :all
  end

  get '/songs/new' do
    @genres = Genre.all

    erb :new
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :show
  end

  post '/songs' do
    song = Song.create(params["song"])
    song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    song.save

    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all

    erb :edit
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.update(params["song"])
    song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    song.save

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end
end
