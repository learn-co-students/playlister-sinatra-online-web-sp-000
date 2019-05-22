class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  # get '/songs' do
  #   @songs = Song.all
  #   erb :'/songs/index'
  # end

  # get '/artists' do
  #   @artists = Artist.all
  #   erb :'/artists/index'
  # end

  # get '/genres' do
  #   @genres = Genre.all
  #   erb :'/genres/index'
  # end

  # get '/songs/new' do
  #
  #   erb :'/songs/new'
  # end

  # get '/songs/:slug' do
  #   @song = Song.find{|s|s.slug == params[:slug]}
  #   # binding.pry
  #   erb :'/songs/show'
  # end

  # get '/artists/:slug' do
  #   @artist = Artist.find{|a|a.slug == params[:slug]}
  #
  #   erb :'/artists/show'
  # end

  # get '/genres/:slug' do
  #   @genre = Genre.find{|g| g.slug == params[:slug]}
  #
  #   erb :'/genres/show'
  # end

  # post '/songs' do
  #   @song = Song.create(:name => params["Name"])
  #   @song.artist = Artist.find_or_create_by(:name => params["artist_name"])
  #   @song.genre_ids = params[:genres]
  #   @song.save
  #
  #
  #   flash[:message] = "Successfully created song."
  #   # binding.pry
  #   redirect to ("/songs/#{@song.slug}")
  #
  #
  # end
end
