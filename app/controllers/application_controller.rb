class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  last_edit = nil

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all

    erb :'songs/new'
  end

  get '/songs/:id' do
    if Song.find { |song| song.id == params[:id] }
      @song = Song.find(params[:id])
    else
      @song = Song.find_by_slug(params[:id])
    end

    if @song == Song.all.last
      @new_song_message = true
    end

    if @song == last_edit
      @changed_song_message = true
    end
    
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end

  patch '/songs/:id' do
    song = Song.find(params[:id])
    song.name = params[:song][:name]
    song.genres = []
    params[:song][:genre_ids].each do |genre_id|
      song.genres << Genre.find(genre_id)
    end
    artist = Artist.find_by(:name => params[:song][:artist][:name])
    if !artist
      artist = Artist.new(:name => params[:song][:artist][:name])
      artist.save
    end
    song.artist_id = artist.id
    if song
      song.save
    end

    last_edit = song

    redirect :"/songs/#{song.slug}"
  end

  post '/songs' do
    song = Song.new
    song.name = params[:song][:name]
    params[:song][:genre_ids].each do |genre_id|
      song.genres << Genre.find(genre_id)
    end
    artist = Artist.find { |a| a.name == params[:artist_name] }
    if !artist
      artist = Artist.new(:name => params[:artist_name])
      artist.save
    end
    song.artist_id = artist.id
    if song
      song.save
    end

    redirect :"/songs/#{song.slug}"
  end
end
