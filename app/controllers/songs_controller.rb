class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    @artists = Artist.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])



    if !params[:artist][:name].empty?
      @song.artist = Artist.create(params[:artist])
      #artist.save
      #@song.artist = artist
    end

    if !params[:genre][:name].empty?
      @song.genre_id = Genre.create(params[:genre]).id
    end

    if params[:song][:genre_id] != nil
      @song.genre_id = params[:song][:genre_id]
    end

    if params[:song][:artist_id] != nil
      @song.artist = Artist.find(params[:song][:artist_id])
    end

    #if !params[:song][:genre][:name].empty?
    #  @song.genre = Genre.create(params[:genre])
    #end

    @song.save

    #puts song.name

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #@artist = @song.artist
    erb :'songs/show'
  end
end
