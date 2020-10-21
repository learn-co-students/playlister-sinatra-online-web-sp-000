class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/artists' do
    @artists = Artist.all
    erb :"artists/index"
  end

  get '/genres' do
    @genres = Genre.all
    erb :"genres/index"
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :"songs/new"
  end

  post '/songs' do
    if !params["song"]["name"].empty?
      @song = Song.new(params[:song])
    end

    if !params[:artist][:name].empty?
      @artist = Artist.find_by(name: params[:artist][:name])
      if !@artist 
        @artist = Artist.create(params[:artist])
      end
      @song.artist_id = @artist.id
    end
     
    
    @genre = Genre.find(params[:genre][:ids])
    @song.genres << @genre
    # @artist.songs << @song
    @song.save
   
    redirect "songs/#{@song.slug}"

  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :"artists/show"
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :"genres/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    @artist = @song.artist
    @genres = Genre.all
    erb :"songs/edit"
  end

  patch '/songs/:slug' do 
    @song= Song.find_by(name: params[:song][:name])
    
    @song.update(params["song"])
    @artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.artist_id = @artist.id
    @song.save
   
    redirect "songs/#{@song.slug}"
  end
end