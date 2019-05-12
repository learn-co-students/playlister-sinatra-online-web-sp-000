require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do

    @song = Song.create(name: params[:Name])
    @song.artist = Artist.find_or_create_by(name: params[:'Artist Name'])
    params[:genre_ids].each do |genre_id|
      @song.genres << Genre.find(genre_id.to_i)
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all
    @song = Song.find_by_slug params[:slug]
    erb :'/songs/edit'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug params[:slug]
    erb :'/songs/show'
  end

  patch '/songs/:id' do

    @song = Song.find(params[:id].to_i)
    @song.update(name: params[:Name], genre_ids: params[:genre_ids], artist: Artist.find_or_create_by(name: params[:'Artist Name']))

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
