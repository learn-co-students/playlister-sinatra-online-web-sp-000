class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    erb :"songs/new"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @genres = @song.genres
    @artist = @song.artist
    erb :"songs/show"
  end

  post '/songs' do
    #create a song with existing artist and existing genre
    #create a song without existing artist and existing genre
    #cant leave the radio button blank
    #cant leave the genre checkbox blank
    puts params
  end

end
