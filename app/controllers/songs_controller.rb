class SongsController < ApplicationController
  get '/songs' do
    @songs=Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @song=Song.find_by_slug(params[:slug].downcase)
    @artist=Artist.find(@song.artist_id)
    @genre=Genre.find(SongGenre.find(@song.id).genre_id)
    erb :'songs/show'
  end

  get '/artists/:slug' do
    @artist=Artist.find_by_slug(params[:slug].downcase)
    @song=Song.find_by(artist_id: @artist.id)
    @genre=Genre.find(SongGenre.find(@song.id).genre_id)
    erb :'artists/show'
  end

  get '/genres/:slug' do
    @genre=Genre.find_by_slug(params[:slug].downcase)
    @artist=Artist.find(SongGenre.find(@genre.id).song_id)
    @song=Song.find(SongGenre.find(@genre.id).song_id)
    erb :'genres/show'
  end


end
