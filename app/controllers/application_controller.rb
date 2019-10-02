class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
    
  get '/songs' do  
	@songs = Song.all
	erb :'song/songs'
  end

  get '/artists' do
    @artists = Artist.all
	erb :'artist/artists'
  end
  
  get '/genres' do 
	@genres = Genre.all 
	erb :'genre/genres'
	end 

  get '/songs/:slug' do 
	 @song = Song.find_by_slug(params[:slug])
    erb :'song/show'
  end

  get '/artists/:slug' do 
	 @artist = Artist.find_by_slug(params[:slug])
    erb :'artist/show'
  end

  get '/genres/:slug' do 
	 @genre = Genre.find_by_slug(params[:slug])
    erb :'genre/show'
  end


end