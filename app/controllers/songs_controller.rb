class SongsController < ApplicationController
  # rake db:migrate SINATRA_ENV=test
  # rspec spec/features/04_basic_view_spec.rb --fail-fast
  get '/songs' do
    @all_songs = Song.all
    erb :song_index
  end
  
  post '/songs' do
  end
  
  get '/songs/new' do
  end
  
  get '/songs/:slug' do
  end
  
  get '/songs/:slug/edit' do
  end
  
  patch '/songs/:slug' do
  end
  
end
