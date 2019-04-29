class SongsController < ApplicationController
  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    song = Song.create(name:params["Name"])
    song.artist = Artist.find_or_create_by(name:params["Artist Name"])
    params[:genres].each do |genre_name|
      song.genres << Genre.find_or_create_by(name: genre_name)
    end
    song.save
    
    flash[:message] = "Successfully created song."
    redirect :"/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.name = params["Name"]
    if params["Artist Name"] != ""
      song.artist = Artist.find_or_create_by(name:params["Artist Name"])
    end
    song.genres = []
    params[:genres].each do |genre_name|
      song.genres << Genre.find_or_create_by(name:genre_name)
    end
    song.save

    flash[:message] = "Successfully updated song."
    redirect :"/songs/#{song.slug}"
  end
end
