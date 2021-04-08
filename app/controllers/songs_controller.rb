require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :"/songs/new"
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if Artist.find_by(name: params[:artist][:name])
      @song.artist = Artist.find_by(name: params[:artist][:name])
    else
      @song.create_artist(name: params[:artist][:name])
    end
    @song.save

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :"/songs/edit"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end


  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    if @song.artist.name != params[:artist][:name]
      if Artist.find_by(name: params[:artist][:name])
        @song.artist = Artist.find_by(name: params[:artist][:name])
      else
        @song.create_artist(name: params[:artist][:name])
      end
      @song.save
    end
    flash[:message] = "Successfully updated song."
    redirect "songs/#{@song.slug}"
  end


end
