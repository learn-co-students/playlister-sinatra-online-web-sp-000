class SongsController < ApplicationController
  require 'rack-flash'
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :'/songs/show'
  end

  post '/songs' do

    @song= Song.create(name: params[:song_name])
    if Artist.find_by(name: params[:artist_name])
      @artist = Artist.find_by(name: params[:artist_name])
      @song.artist = @artist
    else
      @artist = Artist.new(name: params[:artist_name])
      @song.artist = @artist
    end

    if params[:genres]
      @genres = []
      params[:genres].each do |genre_id|
        #binding.pry
        @genres << Genre.find(genre_id.to_i)
      end
    else
    end

    if @song.genres.empty? && params[:genres]
       @song.genre_ids = params[:genres]
      @song.save
    elsif @song.genres.empty? && params[:genre_name]
      genre = Genre.create(name: params[:genre_name])
      @song.genre_ids = genre.id
      @song.save
    else
     #binding.pry
    end

    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song_name] unless params[:song_name].empty?
    if params[:artist_name]
      present_artist = Artist.find_by(name: params[:artist_name])
      if present_artist
        @song.artist = present_artist
        @song.save
      else
        #binding.pry
        if present_artist == nil
          new_artist = Artist.create(name: params[:artist_name])
          new_artist.save
          @song.artist = new_artist
          @song.save
        else
          @song.artist = present_artist
          @song.save
        end
      end
      #binding.pry
    end

    @song.genre_ids = params[:genres]

    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end


end
