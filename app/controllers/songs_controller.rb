require 'pry'
require 'rack-flash'


class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash
  # rake db:migrate ; rake db:migrate SINATRA_ENV=test
  # rspec spec/features/04_basic_view_spec.rb --fail-fast
  # rspec spec/features/05_song_form_spec.rb --fail-fast
 
  post '/songs' do
    @new_song = Song.create(params[:song])
    @new_song.genre_ids = params[:genres]
    @new_song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @new_song.save
    flash[:notice] = "Successfully created song." 
    redirect "/songs/#{@new_song.slug}"
  end

  get '/songs' do
    @all_songs = Song.all
    erb :song_index
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
    @slug = params[:slug]
    @update = Song.find_by_slug(@slug)
    @update.update(params[:song])
    @update.genre_ids = params[:genres]
    @update.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @update.save
    flash[:notice] = "Successfully updated song."
    redirect "/songs/#{@update.slug}"
  end
  
end
