require 'pry'
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

  post '/songs' do
    @song = Song.create(params[:song])
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(params[:artist])
    end
    if !params[:genre][:name].empty?
      @song.genres << Genre.find_or_create_by(params[:genre])
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    @artists = Artist.all
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(params[:artist])
    end
    if !params[:genre][:name].empty?
      @song.genres << Genre.find_or_create_by(params[:genre])
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres
    erb :'songs/show'
  end

end
