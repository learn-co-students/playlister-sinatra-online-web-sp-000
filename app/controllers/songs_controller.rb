class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    new_song = Song.create(params[:song])
    if !params[:artist].empty?
      new_artist = Artist.create(params[:artist])
      new_song.artist_id = new_artist.id
    end
    flash[:message] = "Successfully created song."
    redirect "/songs/#{new_song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do

  end

  patch '/songs/:slug' do

  end
end
