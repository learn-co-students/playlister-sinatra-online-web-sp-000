class SongsController < ApplicationController
  # rake db:migrate ; rake db:migrate SINATRA_ENV=test
  # rspec spec/features/04_basic_view_spec.rb --fail-fast
  # rspec spec/features/05_song_form_spec.rb --fail-fast
 
  get '/songs' do
    @all_songs = Song.all
    erb :song_index
  end
  
  post '/songs' do
  end
  
  get '/songs/new' do
    erb :new_song
  end
  
  get '/songs/:slug' do
    @slug = params[:slug]
    @slug_song = Song.find_by_slug(@slug)
    erb :song_slug
  end
  
  get '/songs/:slug/edit' do
    @slug = params[:slug]
    @slug_song = Song.find_by_slug(@slug)
    erb :songs_slug_edit
  end
  
  patch '/songs/:slug' do
  end
  
end
