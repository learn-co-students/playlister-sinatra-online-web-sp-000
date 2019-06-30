class SongsController < ApplicationController

  get '/songs/new' do
      @genres = Genre.all
      erb :'/owners/new'
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

end
