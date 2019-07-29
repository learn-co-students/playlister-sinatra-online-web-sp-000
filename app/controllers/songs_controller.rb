require 'rack-flash'
class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash
  
  get '/songs' do
    erb :'/songs/index'
  end
  
  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end
  
  post '/songs' do
    @song = Song.create(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    params[:genre][:genre_ids].each do |genre_id|
      @song.genres << Genre.find(genre_id)
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end
  
    
  get '/songs/:slug' do
    if @song = Song.find_by_slug(params[:slug])
      @artist = @song.artist
      erb :'/songs/show'
    end
  end
  
  get '/songs/:slug/edit' do
    if @song = Song.find_by_slug(params[:slug])
      erb :'/songs/edit'
    end
  end
  
  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song][:name]
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genres.clear
    params[:genre][:genre_ids].each do |genre_id|
      @song.genres << Genre.find(genre_id)
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
  
end