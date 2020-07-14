class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    
    @song = Song.create(name: params[:song][:name])
    
    params[:song][:genre_ids].each do |genre_id|
      @genre = Genre.find(genre_id)
      @song.genres << @genre
    end

    @artist = Artist.find_by_name(params[:song][:artist][:name])
    @artist ||= Artist.create(params[:song][:artist])
    @artist.songs << @song

    flash[:success] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all

    erb :'songs/edit'
  end

  patch '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    if !params[:song][:artist][:name].empty?
      @artist = Artist.find_by_name(params[:song][:artist][:name])
      @artist ||= Artist.create(params[:song][:artist])
      
      @song.update(artist: @artist) 
    end

    params[:song][:genre_ids].each do |genre_id|
      @genre = Genre.find(genre_id)
      @song.genres << @genre
    end

    flash[:success] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    
    erb :'songs/show'
  end

end