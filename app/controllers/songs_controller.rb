require 'rack-flash'
class SongsController < ApplicationController

  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  use Rack::Flash

  get '/songs' do 
    @songs = Song.all
	erb :'songs/index'
  end

  get '/songs/new' do
  	erb :'songs/new'
  end

  post '/songs' do 
  	song = Song.create(name: params[:song_name])
  	song.artist = Artist.find_or_create_by(name: params[:artist_name])
  	params[:genres].each do |genre|
  	  song.genres << Genre.find(genre)
  	end
    song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{song.slug}"
  end

  get '/songs/:slug' do
  	@song = Song.find_by_slug(params[:slug])
  	 erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
  	@song = Song.find_by_slug(params[:slug])
  	@song.genres = []
  	@song.name = params[:name]
  	@song.artist.update(name: params[:artist_name])
  	
  	params[:genres].each do |g|
  	  
  	  genre = Genre.find_by(id: g)	
  	  @song.genres << genre
  	end

  	@song.save

    flash[:message] = "Successfully updated song."
  	redirect to "/songs/#{@song.slug}"
  end		
end