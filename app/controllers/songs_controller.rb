class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @artist = Artist.find_by(name: params["artist"]["name"])
    if @artist.nil?
      @artist = Artist.create(params[:artist])
    end
    @genre = Genre.find_by(name: params["genre"]["name"])
    @song = Song.create(name: params["song"]["name"], artist: @artist)
    if !@genre.nil?
      @song.genre_ids = @genre.id
    end
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
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

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by(name: params["artist"]["name"])
    if @artist.nil?
      @artist = Artist.create(params[:artist])
    end
    @song.update(artist: @artist)

    @genre = Genre.find_by(name: params["genre"]["name"])
    if !@genre.nil?
      @song.genre_ids = @genre.id
    end

    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
