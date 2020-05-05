class SongsController < ApplicationController

  # This should present the user with a list of all songs in the library.
  # Each song should be a clickable link to that particular song's show page.
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    erb :'/songs/new'
  end

  # Any given song's show page should have links to that
  # song's artist and each genre associated with the song.
  get '/songs/:slug' do
    slug = params[:slug]
    @songs = Song.find_by_slug(slug)
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save

    redirect "/songs/#{@song.slug}"
  end


end
