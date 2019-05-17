class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])

    artist = Artist.find_by(name: params[:artist])
    if artist.nil?
      artist = Artist.create(name: params[:artist])
    end
    artist.songs << @song

    params[:genres].each do |g|
      Genre.find(g).songs << @song
    end

    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    artist = Artist.find_by(name: params[:artist])
    if artist.nil?
      artist = Artist.create(name: params[:artist])
    end

    params[:song]["artist_id"] = artist.id
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    artist.songs << @song

    params[:genres].each do |g|
      Genre.find(g).songs << @song
    end

    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end
end