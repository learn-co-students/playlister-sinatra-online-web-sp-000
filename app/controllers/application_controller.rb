require 'rack-flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  use Rack::Flash

  get '/' do
    erb :index
  end

  get '/songs' do
    #displays a list of songs (FAILED - 2)
    @songs = Song.all
    #contains links to each song's show page (FAILED - 3)
    erb :'/songs/index'
  end 

  get '/artists' do
    #displays a list of artists (FAILED - 5)
    @artists = Artist.all
    #contains links to each artist's show page (FAILED - 6)
    erb :'/artists/index'
  end 

  get '/genres' do
    #displays a list of genres (FAILED - 8)
    @genres = Genre.all
    #contains links to each genre's show page (FAILED - 9)
    erb :'/genres/index'
  end 

  get '/songs/new' do
    @genres = Genre.all
    @artists = Artist.all
    #without an existing artist
      #creates a new artist on submit (FAILED - 25)
      #creates a new song on submit (FAILED - 26)
      #redirects to '/songs/:slug' after creation (FAILED - 27)
    #with an existing artist
      #does not create a new artist (FAILED - 28)
      #creates a new song and associates it with an existing artist (FAILED - 29)
      #redirects to '/songs/:slug' after creation (FAILED - 30)
      erb :'/songs/new'
  end

  post '/songs' do
    #Create the song
    #binding.pry
    if Artist.find_by(name: params["Artist Name"]) == nil
      #If the artist is not in the Artist.all array
      @song = Song.create(name: params["Name"])
      @artist = Artist.create(name: params["Artist Name"])
      @song.artist = @artist
      @song.save
    else
      #Otherwise...
      @song = Song.create(name: params["Name"])
      @artist = Artist.find_by(name: params["Artist Name"])
      @song.artist = @artist
      @song.save
    end 
    @genre = Genre.find(params[:genres])
    @song.genres << @genre
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end 

  get '/songs/:slug' do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :'/songs/show'
  end
  
  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end
  
  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end
  
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    @artists = Artist.all
    erb :'/songs/edit'
  end 

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params["Name"]
    if Artist.find_by(name: params["Artist Name"]) == nil
       @artist = Artist.create(name: params["Artist Name"])
    else 
      @artist = Artist.find_by(name: params["Artist Name"])
    end 
    @song.artist = @artist
    @genre = Genre.find(params[:genres])
    @song.genres << @genre
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end 
end