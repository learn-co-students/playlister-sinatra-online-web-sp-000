class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all

    @genres.each do |genre|
      genre.slug
    end

    erb :'/songs/new'
  end

  post '/songs' do

    @artist = Artist.find_or_create_by(name: params[:artist_name])
    @song = Song.create(name: params[:name], artist_id: @artist.id)

    params[:genres].each do |g|
      @song.song_genres.build(genre_id: g)
    end

    @song.slug

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug_name}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by(id: @song.artist_id)

    erb :'/songs/show'
  end

  patch '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])

    if !params[:artist_name].empty?
      @artist = Artist.find_or_create_by(name: params[:artist_name])
    else
      @artist = Artist.find_by(id: params[:artist])
    end

    @genres = []

    params[:genres].each do |genre_id|
      @song.song_genres.build(genre_id: Genre.find_by(id: genre_id))
      @genres << Genre.find_by(id: genre_id)
    end

    if !params[:genre_name].empty?
      new = Genre.create(name: params[:genre_name])
      @song.song_genres.build(genre_id: new.id)
      @genres << Genre.find_by(id: genre_id)
    end

    @song.update(name: params[:song_name], artist_id: @artist.id)
    @song.update(genres: @genres)
    @song.slug

    flash[:message] = "Successfully updated song."
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artists = Artist.all
    @artist = Artist.find_by(id: @song.artist_id)
    @genres = Genre.all
    @genre = @song.genres

    erb :'/songs/edit'
  end

end
