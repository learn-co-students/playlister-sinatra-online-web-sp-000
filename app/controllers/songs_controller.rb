class SongsController < ApplicationController
  
  get '/songs' do  
	@songs = Song.all
	erb :'song/songs'
  end

  
  get '/songs/:slug' do 
	 @song = Song.find_by_slug(params[:slug])
    erb :'song/show'
  end

  get '/songs/new' do 
	erb :'song/form'
  end

  post '/songs' do 	
	@new_song = Song.create(:name => params["Name"])
	@new_song.artist = Artist.find_or_create_by(name: params[:artist_name])
	@new_song.genres = params[:genres]

	@new_song.save

	redirect("/songs/#{@song.slug}")
  end
  


end
