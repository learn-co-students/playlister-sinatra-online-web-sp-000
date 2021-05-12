require 'pry'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


  #binding.pry

  get '/' do
    "Hello World"
  end

  get '/songs' do
    @songs = Song.all
    erb :songs
  end

  get '/artists' do
    @artists = Artist.all
    erb :artists
  end

  get '/genres' do
    @genres = Genre.all
    erb :genres
  end

  get '/songs/new' do
    erb :new_song
  end

  post '/songs/new' do 
    "Successfully created song."
    if (Artist.find_by_name(params[:song][:artist]))
      @new = Song.create(name: params[:song][:name], artist: Artist.find_by_name(params[:song][:artist]))
    else
      @newArt = Artist.create(name: params[:song][:artist])
      @new = Song.create(name: params[:song][:name], artist: Artist.find_by_name(params[:song][:artist]))
    end
    params[:song][:genre].each do | sel |
      id = sel.to_i
      @new.genres << Genre.find(id)
    end
    redirect to "/songs/#{@new.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :edit_song
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :song
  end

  patch '/songs/:slug' do
    "Successfully updated song."
    @song = Song.find_by_slug(params[:slug])
    if (params[:Name] != "")
      @song.name = params[:Name]
    end
    if (params[:song][:artist] != "")
      if (Artist.find_by_name(params[:song][:artist]) == nil)
        @newArt = Artist.create(name: params[:song][:artist])
        @song.artist = @newArt
      else
        @oldArt = Artist.find_by_name(params[:song][:artist])
        @song.artist = @oldArt
      end
    end
    @song.genres.clear
    params[:song][:genre].each do | sel |
      id = sel.to_i
      @song.genres << Genre.find(id)
    end
    @song.save 
    redirect "/songs/#{@song.slug}"
  end

  get '/artists/:slug' do
    @sel = Artist.find_by_slug(params[:slug])
    erb :artist
  end

  get '/genres/:slug' do
    @sel = Genre.find_by_slug(params[:slug])
    erb :genre
  end


end