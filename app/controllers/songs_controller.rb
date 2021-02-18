class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    @artists = Artist.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])

    if params[:artist][:name]
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    else
      @song.artist = Artist.find(params[:artist][:id])
    end

    new_genre = params[:new_genre]
    @song.genres << Genre.create(name: new_genre) unless new_genre

    params[:song][:genre_ids].each do |id|
      @song.genres << Genre.find(id)
    end

    @song.save

    redirect "/songs/#{@song.slug}"
  end
end