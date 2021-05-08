require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash
  
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index' 
  end
  
  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end
  
  get '/songs/:slug' do
    
    @song = Song.find_by_slug(params[:slug])
    
    @artist = Artist.find(@song.artist_id)
   
    @genres = @song.genres
    
    erb :'/songs/show' 
  end
  
  post '/songs' do 
    # See if artist already exists
    @artist = Artist.find_by(name: params[:artist][:name])
    
    if !@artist
      @artist = Artist.create(params[:artist])
    end
    
    @song = Song.create(name: params[:song][:name], artist_id: @artist.id)
    
    params[:genres].each do |genre|
      SongGenre.create(song_id: @song.id, genre_id: genre)
    end
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end
  
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end
  
  patch '/songs/:slug' do 
    song = Song.find_by_slug(params[:slug])
    
    artist = Artist.find_by(name: params[:artist][:name])
    if !artist
      artist = Artist.create(params[:artist])
    end
     song_genres = []
     
    params[:genres].each do |genre|
     song_genres << SongGenre.create(song_id: song.id, genre_id: genre)
    end
    
    # update song
    song.update(name: params[:song][:name], artist: artist, song_genres: song_genres)
    song.save
    flash[:message] = "Successfully updated song."
    redirect to "songs/#{song.slug}"
  end
  
  
end
