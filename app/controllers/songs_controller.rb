require 'rack-flash'
require 'pry'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
     erb :'/songs/new'
   end

   get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
   end

   post '/songs' do
     binding.pry
       @song = Song.create(params["song"]["name"])
       @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
       @song.genre_ids = params["genre"]["name"]
       @song.save
       redirect("/songs/#{@song.slug}")
     end



end
