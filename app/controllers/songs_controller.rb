class SongsController < ApplicationController

  #flash[:message] = ""
  @@message = ""

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.artist.songs << @song
    @song.genre_ids = params[:genres]

    @@message = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show', locals: {message: @@message}
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #update the song title if it's not empty
    @song.update(params[:song]) if params[:song][:name] != ""
    #update the song artist if it's not empty
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name]) if params[:artist][:name] != ""
    #add the song to the artist's songs
    @song.artist.songs << @song
    #set the song's genre ids
    @song.genre_ids = params[:genres]
    #save the song in the db
    @song.save
    #send a success message
    @@message = "Successfully updated song."

    redirect "/songs/#{@song.slug}"
  end

end
