require "pry"
require "rack-flash"

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get "/songs" do
    @songs = Song.all
    erb :'/songs/index'
  end

  get "/songs/new" do
    @genres = Genre.all
    @artists = Artist.all
    erb :'/songs/new'
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post "/songs" do
    @song = Song.create(params[:song])
    if !params["artist"]["name"].empty? && Artist.find_by(name: params["artist"]["name"]) == nil
      @song.artist = Artist.create(name: params["artist"]["name"])
      @song.save
    elsif !params["artist"]["name"].empty? && Artist.find_by(name: params["artist"]["name"])
      @song.artist = Artist.find_by(name: params["artist"]["name"])
      @song.save
    end
    flash[:message] = "Successfully created song."
    redirect "songs/#{@song.slug}"
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    @artists = Artist.all
    erb :'/songs/edit'
  end

  patch "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params[:song][:artist])

    @song.artist = Artist.find_or_create_by(name: params[:song][:artist])

    @song.genre_ids = params[:genres]

    @song.save #find song then update it, then find the artist and then update song with the artist, find genre, update with genre. then pry through every line and look at params and see what you're getting.
    flash[:message] = "Successfully updated song." #really close with this code here. look in shotgun and see what happens when you update a song.

    redirect to "songs/#{@song.slug}"
  end
end
