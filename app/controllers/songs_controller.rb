class SongsController <ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :new
  end


  get '/songs/:slug' do
    @song = Song.find_by_id(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :edit
  end

  post '/songs' do
    song = Song.create(name: params[:song][:name])
    artist = Artist.find_or_create_by(name: params[:song][:artist])
    song.genre_ids = params[:genres]
    song.artist = artist
    song.save
    redirect to("/songs/#{song.slug}")
end


end
