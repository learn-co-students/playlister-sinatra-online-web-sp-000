class SongsController < ApplicationController
  
  get '/songs'
    @songs = Song.all
  end
  
end
