class SongsController < ApplicationController
  
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
    
    redirect to "songs/#{@song.slug}"
  
  end
  
  
end
