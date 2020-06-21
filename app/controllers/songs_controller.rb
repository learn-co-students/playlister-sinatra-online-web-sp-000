class SongsController < ApplicationController

  get '/songs' do 
    @songs = Song.all 
    erb :'/songs/index'
  end 

  #new goes before slug

  get '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end 

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.create(:name => params["Artist Name"])
    redirect "/songs/#{@song.slug}"
  end

end