class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions 
  require 'rack-flash'
  use Rack::Flash

  get '/' do
    erb :index
  end

# SONGS
  get '/songs/new' do 
    erb :'/songs/new'
  end
  
  get '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/edit'
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index' 
  end 

  patch '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genres.clear
    params[:genre].keys.each do |genre|
      @song.genres << Genre.find_by(name: genre)
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

  post '/songs' do
    @song = Song.create(name: params[:song_name])
    if !params[:artist][:name].nil?
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end
    params[:genre].keys.each do |name| 
      @song.genres << Genre.find_by(name: name)
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end 

#  ARTISTS
  get '/artists/:slug' do 
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end 

  get '/artists' do 
    @artists = Artist.all
    erb :'/artists/index'
  end 

# GENRES
get '/genres/:slug' do 
  @genre = Genre.find_by_slug(params[:slug])
  erb :'/genres/show'
end

get '/genres' do 
  @genres = Genre.all 
  erb :'/genres/index'
end 

end