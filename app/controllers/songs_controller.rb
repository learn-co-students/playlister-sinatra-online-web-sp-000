class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    @artists = Artist.all
    #binding.pry
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/edit'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    
    if !params[:artist][:name].empty?
      if !!Artist.find_by(name: params[:artist][:name])
        @artist = Artist.find_by(name: params[:artist][:name])
      else
        @artist = Artist.create(name: params[:artist][:name])
      end
    else
      @artist = Artist.find(params[:song][:artist_id])
    end
    if @artist
      @song.artist = @artist
    end
    @song.save

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])

    if !params[:artist][:name].empty?
      if !!Artist.find_by(name: params[:artist][:name])
        @artist = Artist.find_by(name: params[:artist][:name])
      else
        @artist = Artist.create(name: params[:artist][:name])
      end
    else
      @artist = Artist.find(params[:song][:artist_id])
    end
    if @artist
      @song.artist = @artist
    end
    @song.save

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end