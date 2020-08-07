class SongGenresController < ApplicationController

    get '/song_genres' do
      erb :"/songgenres/index"
    end
  
    
  end