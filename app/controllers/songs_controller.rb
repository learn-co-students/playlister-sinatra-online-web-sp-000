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
    @artist_id = Artist.find_by(params[:id]).id
    @song.update(artist_id: @artist_id)

    if !params["song"]["artist"].empty?
      @song.artist = Artist.find_or_create_by(name: params["song"]["artist"])

      @song.save
    end

    flash[:message] = "Successfully updated song."

    redirect to "songs/#{@song.slug}"
  end
end
