class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do

    erb :'/songs/new'

  end

  post '/songs' do

    @song = Song.create(params["song"])

    if !params["artist"]["name"].empty?
      @song.artist = Artist.find_or_create_by(params["artist"])
    end
    if !params["genre"]["name"].empty?
      @song.genres << Genre.find_or_create_by(params["genre"])
    end
    @song.save

    #  code for creating and saving a new song
    flash[:message] = "Successfully created song."

    redirect to "/songs/#{@song.slug}"

  end

  get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/show'
  end


  get '/songs/:slug/edit' do

    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/edit'
  end


  patch '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])

    @song.update(params["song"])

    if !params["artist"]["name"].empty?
      artist = Artist.create(name: params["artist"]["name"])
      @song.artist = artist
    end

    if !params["genre"]["name"].empty?
      @song.genres << Genre.create_by(params["genre"])
    end

  	@song.save

    flash[:message] = "Successfully updated song."

    redirect to "songs/#{@song.slug}"

  end

end
