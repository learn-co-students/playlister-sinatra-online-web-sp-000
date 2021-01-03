require 'rack-flash'

class ApplicationController < Sinatra::Base
  enable :sessions
  use Rack::Flash

  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"

  set :views, Proc.new { File.join(root, "../views/") }

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do

    @song = Song.new(params[:song])
    @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    params[:genres].each do |genre_id|
      add_genre = SongGenre.create(song: @song, genre: Genre.find_by_id(genre_id))
    end
    @song.save
    flash[:message] = "Successfully created song."

    redirect "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params["song"])
    @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])

    params[:genres].each do |genre_id|
      add_genre = SongGenre.create(song: @song, genre: Genre.find_by_id(genre_id))
    end
    @song.save
    flash[:message] = "Successfully updated song."

    redirect "songs/#{@song.slug}"

  end


end
