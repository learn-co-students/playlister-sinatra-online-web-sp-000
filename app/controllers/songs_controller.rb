require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash

  get '/songs' do
    @all_songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @all_genres = Genre.all
    @all_artists = Artist.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])

    # Update the song's genre(s)
    if params[:song][:genres]
      params[:song][:genres].each do |genre_id|
        @song.genres << Genre.find(genre_id)
      end
    end

    # Update the song's artist
    if Artist.find_by(name: params[:artist])
      artist = Artist.find_by(name: params[:artist])
      artist.songs << @song
      artist.save
    else
      new_artist = Artist.create(name: params[:artist])
      new_artist.songs << @song
      new_artist.save
    end

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @all_artists = Artist.all
    @all_genres = Genre.all
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params[:song][:name])

    # Update the song's genre(s)
    @song.genres.clear
    if params[:song][:genres]
      params[:song][:genres].each do |genre_id|
        genre = Genre.find(genre_id)
        @song.genres << genre
      end
    end

    # Update the song's artist
    if Artist.find_by(name: params[:artist])
      artist = Artist.find_by(name: params[:artist])
      artist.songs << @song unless artist.songs.include?(@song)
      artist.save
    else
      new_artist = Artist.create(name: params[:artist])
      new_artist.songs << @song
      new_artist.save
    end

    #@song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
