class SongGenresController < ApplicationController

    get '/song_genres' do
      erb :songgenres
    end
  end