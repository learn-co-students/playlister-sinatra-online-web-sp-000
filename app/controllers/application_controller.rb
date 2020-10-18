require 'rack-flash'

class ApplicationController < Sinatra::Base
configure do
  register Sinatra::ActiveRecordExtension
  enable :sessions
  use Rack::Flash
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
end


  get '/' do
    erb :index
  end

  get '/songs' do 
  	@songs = Song.all
  	erb :'songs/index'
  end

  get '/artists' do 
  	@artists = Artist.all
  	erb :'artists/index'
  end

  get '/genres' do 
  	@genres = Genre.all
  	erb :'genres/index'
  end

  get '/songs/new' do
  	@artists = Artist.all
  	@genres = Genre.all
  	erb :'songs/new'
  end

  get '/songs/:slug' do
  	@song = Song.find_by_slug(params[:slug])
  	@artist = @song.artist
  	@genres = @song.genres

  	erb :'songs/show'
  end

  get '/artists/:slug' do
  	@artist = Artist.find_by_slug(params[:slug])
  	@songs = @artist.songs
  	@genres = @artist.genres

  	erb :'artists/show'
  end


  post '/songs' do
  	@song = Song.create(params[:song])

  	if @song.artist = Artist.find_by_name(params[:artist][:name])
		@song.save
	else
		@song.artist = Artist.create(name: params[:artist][:name])
	end

	@song.genres = Genre.find(params[:genres])
	@song.save

  	flash[:message] = "Successfully created song."
  	redirect to ("/songs/#{@song.slug}")

  end


  get '/genres/:slug' do
  	@genre = Genre.find_by_slug(params[:slug])
  	@artists = @genre.artists
  	@songs = @genre.songs

  	erb :'genres/show'
  end

  get '/songs/:slug/edit' do
  	@song = Song.find_by_slug(params[:slug])
  	@artist = @song.artist
  	@genres = Genre.all

  	erb :'songs/edit'

  end


  patch '/songs/:slug' do
  	@song = Song.find_by_slug(params[:slug])
  	@song.name = params[:song][:name]
  	if @song.artist = Artist.find_by_name(params[:artist][:name])
		@song.save
	else
		@song.artist = Artist.create(name: params[:artist][:name])
	end

	@song.genres = Genre.find(params[:genres])
	@song.save

  	flash[:message] = "Successfully updated song."
  	redirect to ("/songs/#{@song.slug}")

  end


end