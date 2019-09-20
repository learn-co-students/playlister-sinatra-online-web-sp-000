require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

#This should present the user with a list of all songs in the library.
#Each song should be a clickable link to that particular song's show page.
  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

#Be able to create a song
#Genres should be presented as checkboxes
#Be able to enter the Artist's name in a text field (only one Artist per song.)
  get '/songs/new' do
    # @songs = Song.all
    erb :'/songs/new'
  end

  #Any given song's show page should have links to that song's artist and the
  #each genre associated with the song.
  #
    get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      @artist = @song.artist
      erb :'/songs/show'
    end

#Other routes go in here...
  post '/songs' do
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."

    redirect to "/songs/#{@song.slug}"
  end

#Be able to change everything about a song, including the genres associated
#with it and its artist.
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(:name => params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully updated song."

    redirect to "/songs/#{@song.slug}"
  end
end
