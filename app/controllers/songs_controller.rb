require 'sinatra/base'
require 'rack-flash'
class  SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all

    erb :"/songs/index"
  end

  get '/songs/new' do
    @genres = Genre.all

    erb :"/songs/new"
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params[:artist])
    @song = Song.create(name: params[:name])
    @song.artist = @artist

    if !params[:genre].empty?
      params[:genre].each do |genre_id|
        genre = Genre.find(genre_id)
        @song.genres << genre
      end
    end

    @artist.save
    @song.save
    # binding.pry
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end
  
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    @genre = @song.genres
    # binding.pry
    erb :"/songs/edit"
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params[:name])

    artist = Artist.find_or_create_by(name: params[:artist])
    # binding.pry

    if !artist.songs.include?(@song)
      artist.songs << @song
    end
    artist.save

    @song.genres.clear
    params[:genre].each do |genre_id|
      genre = Genre.find(genre_id)
      @song.genres << genre
    end

    @song.save

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
  
  get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :"/songs/show"
  end

end