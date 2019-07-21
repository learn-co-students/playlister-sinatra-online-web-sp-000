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
    erb :'/songs/new'
  end

  post '/songs' do
  @song = Song.create(params[:song])
  if !params["artist"]["name"].empty?
    @song.artists << Artist.create(name: params["artist"]["name"])
    # When using the shovel operator, ActiveRecord instantly fires update SQL
    # without waiting for the save or update call on the parent object,
    # unless the parent object is a new record.
  end
  redirect "/songs/:slug"
  end

end
