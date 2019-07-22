class SongsController < ApplicationController


  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
  #  binding.pry
  @song = Song.new(:name => params["song_name"])
  @artist = Artist.find_or_create_by(:name => params["artist_name"])

  @song.artist = @artist
  @song.genre_ids = params[:genre_ids]  #should be 1

#  params["genre_ids"].each do |id|
#    @song.genres << Genre.find(id)
#  end

  @song.save

#  flash[:message] = "Successfully created song."
  redirect "/songs/#{@song.slug}"
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
    @song.artist = Artist.find_or_create_by(:name => params["artist_name"])
    @song.genre_ids = params[:genre_ids]

    @song.save



    redirect "/songs/#{@song.slug}"
  end


end
