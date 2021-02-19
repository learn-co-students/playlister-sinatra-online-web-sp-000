require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash
  set :method_override, true

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

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  post '/songs' do
    Song.exists?(name: params[:song][:name]) ? (erb :'/songs/show') : @song = Song.create(params[:song])
    Artist.exists?(name: params[:artist][:name]) ? @song.artist = Artist.find_by(name: params[:artist][:name]) : @song.artist = Artist.create(params[:artist])
    params[:genres].each do |genre|
      @song.genres << Genre.find(genre)
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end  

  put '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    Artist.exists?(name: params[:artist][:name]) ? @song.artist = Artist.find_by(name: params[:artist][:name]) : @song.artist = Artist.create(params[:artist])
    @song.genres = []
    params[:genres].each do |genre|
      @song.genres << Genre.find(genre)
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end 

end