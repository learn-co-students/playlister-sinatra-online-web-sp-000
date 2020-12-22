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
  post '/songs/new' do
    @song = Song.create(params[:song])
    #search for for artist that matches a_n
    @artist = Artist.find_by(:name => params[:artist_name])
    #if no results make new one
    if @artist == nil
      @artist = Artist.create(name: params[:artist_name])
    end
    @song.artist = @artist
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"

  end
  get '/songs/:slug' do
    #raise params.inspect
    @song = Song.find_by_slug(params[:slug])
  #  binding.pry
    erb :'songs/show'
  end
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end
  patch '/songs/:slug' do
  @song = Song.find_by_slug(params[:slug])
  @artist = Artist.find_by(:name => params[:artist_name])
  if @artist == nil
    @artist = Artist.create(name: params[:artist_name])
  end
  @song.artist = @artist
  @song.save
  flash[:message] = "Successfully updated song."
  redirect "/songs/#{@song.slug}"
  end
end
