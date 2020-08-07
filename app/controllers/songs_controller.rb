require 'rack-flash'

class SongsController < ApplicationController
use Rack::Flash

get '/songs' do
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/songs/new' do
    @artists = Artist.all
    @songs = Song.all
    @genres = Genre.all
    erb :'/songs/new'
  end
  
  post '/songs/new' do
    song = params[:song][:name]
    artist = params[:artist][:name]
    @songs = Song.create(name: song)
    @artists = Artist.find_or_create_by(name: artist)
    @songs.artist = @artists
    @songs.genre_ids = params[:genres]
    @songs.save
    # @artists.songs << @songs
    flash[:message] = "Successfully created song."
      # binding.pry
    redirect to :"/songs/#{@songs.slug}"
  end

  get '/songs/:slug' do
    slug = params[:slug]
   
    @songs = Song.find_by_slug(slug)
   
    erb :"songs/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    

    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:song][:genre_ids]
    @song.save
   
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
  

end