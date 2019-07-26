class SongsController < ApplicationController

  get'/songs/new' do
    @genres = Genre.all
    erb :'songs/new'  
  end

  post '/songs' do
    # binding.pry
    if Artist.find_by(name: params["Artist Name"]).nil?
      @artist = Artist.create(name: params["Artist Name"])
      # @song = Song.create(name: params[:song][:name], :artist => artist)
      #   params[:song][:genre_ids].each do |genre|
      #     SongGenre.create(song_id: @song.id, genre_id: genre)
      #   end
    end
    redirect to "/songs/#{@song.slug}"
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
