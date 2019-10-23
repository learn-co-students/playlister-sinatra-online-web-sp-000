require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    erb :"songs/new"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @genres = @song.genres
    @artist = @song.artist
    erb :"songs/show"
  end

  get '/songs/:slug/edit' do

  end

  post '/songs' do
    @song = Song.create(name: params[:name])
    @artist = Artist.find_or_create_by(name: params[:artist_name])
    @artist.songs << @song
    params[:genre].each do |id|
      @song.genres << Genre.find_by_id(id)
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

end
