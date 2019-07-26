
class SongsController < ApplicationController

  get'/songs/new' do
    @genres = Genre.all
    erb :'songs/new'  
  end

  post '/songs' do
    ##if artist doesn't exist
    if Artist.find_by(name: params["Artist Name"]).nil?
      @artist = Artist.create(name: params["Artist Name"])
      @song = Song.create(name: params[:Name], :artist => @artist)
        params[:song][:genre_name].each do |genre|
          genre_id = Genre.find_by(name: genre).id
          SongGenre.create(song_id: @song.id, genre_id: genre_id)
        end
      else
        @artist = Artist.find_by(name: params["Artist Name"])
        @song = Song.create(name: params[:Name], :artist => @artist)
        params[:song][:genre_name].each do |genre|
          genre_id = Genre.find_by(name: genre).id
          SongGenre.create(song_id: @song.id, genre_id: genre_id)
        end
        # binding.pry
    end

    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug.downcase}"
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end
end
