class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  get "/songs/new" do
# binding.pry
    @artists = Artist.all
    @genres = Genre.all

    erb :'/songs/new'
  end


  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end


  post '/songs' do
    @artist = Artist.create(name: params[:artist])
    @genre = Genre.create(name: params[:genre])
    @song = Song.create(name: params[:Name], genre: @genre, artist: @artist)
    # binding.pry
    redirect "/songs/#{@song.slug}"

  end
end
