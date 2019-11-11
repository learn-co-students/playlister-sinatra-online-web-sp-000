class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/song/new' do
    erb :'/song/new'
  end

  get '/song/:slug' do
    @song = Song.find_by_slug(param[:slug])
    erb :'song/show'
  end

  post '/songs' do
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save

    erb :'song/show', locals: {message: "Successfully created song."}
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    @song.update(params[:song])

    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.save

    erb :'song/show', locals: {message: "Song successfully updated."}
  end
end
