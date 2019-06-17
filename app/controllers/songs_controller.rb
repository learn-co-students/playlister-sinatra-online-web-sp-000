require 'rack-flash'
class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    @songs=Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully created song."

    redirect("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully updated song."
    redirect("/songs/#{@song.slug}")
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
