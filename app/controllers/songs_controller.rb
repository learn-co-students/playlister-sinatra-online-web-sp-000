require 'sinatra/base'
require 'rack-flash'

class SongsController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  use Rack::Flash

  get "/songs" do
    @songs = Song.all
    erb :'songs/index'
  end

  get "/songs/new" do
    erb :'songs/new'
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find(@song.artist_id)
    erb :'songs/edit'
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post "/songs" do
    @genre = Genre.find_by name: params[:genres][0]
    @artist = Artist.find_by name: params[:"Artist Name"]
    @artist = Artist.create(name: params[:"Artist Name"]) if @artist == nil
    @song = Song.create(name: params[:Name])
    @artist.songs << @song
    @genre.songs << @song
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params[:Name])
    @genre = Genre.find_by name: params[:genres][0]
    @artist = Artist.find_by name: params[:"Artist Name"]
    @artist.songs << @song unless @artist.songs.include?(@song)
    @genre.songs << @song unless @genre.songs.include?(@song)
    flash[:message] = "Successfully updated song."
    redirect to "songs/#{@song.slug}"
  end



end
