class SongsController < ApplicationController


  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

# stavljanje svega iz NEW u attr accessore @song
  post '/songs' do
  @song = Song.create(:name => params["song_name"])
  @artist = Artist.find_or_create_by(:name => params["artist_name"])

  @song.artist = @artist
  @song.genre_ids = params[:genre_ids]

  @song.save

#  flash[:message] = "Successfully created song."
  redirect "/songs/#{@song.slug}"
  end


  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end


  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])




#    redirect "/owners/#{@owner.id}"
  end


end
