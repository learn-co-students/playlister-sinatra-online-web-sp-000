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
    slug = params[:slug]
    @artist = Artist.find_by_slug(slug).first
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    binding.pry
    @artists = params[:artist][:name]
    artist = params[:artist]
    artist.name = @artists
    artist.save
    
    binding.pry
    @artists.slug = @artists
    # binding.pry
    redirect "songs/#{@artists}"
  end
  

end