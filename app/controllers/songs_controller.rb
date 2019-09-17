require 'pry'
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



  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end



  post '/songs' do
        @song = Song.create(:name => params[:song][:name])

    artist_entry = params[:song][:artist]
    if Artist.find_by(:name => artist_entry)
      artist = Artist.find_by(:name => artist_entry)
    else
      artist = Artist.create(:name => artist_entry)
    end
    @song.artist = artist
  @song.genre_ids = params[:genres]
    @song.save
      flash[:message] = "Successfully created song."
    redirect("/songs/#{@song.slug}")

  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end




end
