class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do

    @song= Song.create(name: params[:song_name])
    if Artist.find_by(name: params[:artist_name])
      @artist = Artist.find_by(name: params[:artist_name])
    else
      @artist = Artist.new(name: params[:artist_name])
    end

    if params[:genres]
      @genres = []
      params[:genres].each do |genre_id|
        @genres << Genre.find(genre_id.to_i)
      end
    else
    end
    @song.genres = @genres
    @song.artist = @artist
    @song.save
    redirect '/songs/#{@song.slug}'
  end

end
