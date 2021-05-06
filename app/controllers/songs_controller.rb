class SongsController < ApplicationController
  
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index' 
  end
  
  get '/songs/new' do
    
  end
  
  get '/songs/:slug' do
    
    @song = Song.find_by_slug(params[:slug])
    binding.pry
    @artist = Artist.find(@song.artist_id)
    song_genre = SongGenre.find_by(song_id: @song.id)
    @genre = Genre.find(song_genre.genre_id)
    erb :'/songs/show' 
  end
  
  
end
