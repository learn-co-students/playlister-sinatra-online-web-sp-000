#understand which controller actions render/load  which views- erb files-(what the user sees)
require 'sinatra/base'
require 'rack-flash'

class SongsController < Sinatra::Base
  enable :sessions
  use Rack::Flash
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

#load all songs from the database and iterate over each song object in songs/index.erb
#get= display all
  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

#iterate over each genre object in songs/new.erb
  get '/songs/new' do
    @genres = Genre.all
    erb :"songs/new"
  end

#post = creates new song
#creates a new song based on the params from the form
#if the params artist entry have a song and artist, we can find the artist by name
#if there is no entry, we will create the artist by song/name
#if the params genre_selections has a song and genre, iterate over each genre and find it
#save the song if you find it/create by that genre
#songs/:slug/edit.erb
#SLUG= replace a name that is not acceptable as a URL ex: /songs/hotline-bling
  post '/songs' do
    #raise params.inspect
    @song = Song.create(:name => params[:song][:name])
    artist_entry = params[:song][:artist]
    if Artist.find_by(:name => artist_entry)
      artist = Artist.find_by(:name => artist_entry)
    else
      artist = Artist.create(:name => artist_entry)
    end
    @song.artist = artist
    genre_selections = params[:song][:genres]
    genre_selections.each do |genre|
      @song.genres << Genre.find(genre)
    end
    @song.save
#when a new song instance is created
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end

#find_by_slug method uses slug method to retrieve a song from the database and return that entry
  get '/songs/:slug' do
    slug = params[:slug]
    @song = Song.find_by_slug(slug)
    erb :"songs/show"
  end

#patch - update/modifies existing
#slugify songs
#if we can find an artist by their name/song, then display that, if not, create by artist name
#same with genres
#flash message at the end to tell the user a new song instance was created/updated
  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.name = params[:song][:name]
    artist_name = params[:song][:artist]
    if Artist.find_by(:name => artist_name)
      if song.artist.name != artist_name
        song.artist = Artist.find_by(:name => artist_name)
      end
    else
      song.artist = Artist.create(:name => artist_name)
    end
    if song.genres
      song.genres.clear
    end
    genres = params[:song][:genres]
    genres.each do |genre|
      song.genres << Genre.find(genre)
    end
    song.save
    flash[:message] = "Successfully updated song."
    redirect to "songs/#{song.slug}"
  end

#be able to change everything about the song, including the genres associated with it and its artist
  get '/songs/:slug/edit' do
    slug = params[:slug]
    @song = Song.find_by_slug(slug)
    erb :"songs/edit"
  end
end
