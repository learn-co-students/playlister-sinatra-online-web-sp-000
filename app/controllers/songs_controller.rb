class SongsController < ApplicationController

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
    @artists = Artist.create(name: artist)

    @artists.songs << @songs
    
     binding.pry
    redirect to :"/songs/#{@songs.slug}"
  end

  get '/songs/:slug' do
    slug = params[:slug]
   
    @songs = Song.find_by_slug(slug)
   
    erb :"songs/show"
  end

  

end