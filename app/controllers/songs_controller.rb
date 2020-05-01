class SongsController < ApplicationController

  get '/songs' do
    @all_songs = Song.all
    erb :songs_index
  end

end
