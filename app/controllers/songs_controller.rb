class SongsController < ApplicationController
  
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/new' do
    @songs = Song.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    @song = Song.create(name: params[:song_name])

    @song.artist = Artist.find_or_create_by(params[:artist])
    @song.genre_ids = params[:genres]
    @song.save
    redirect "songs/#{@song.slug}"
  end
  
end