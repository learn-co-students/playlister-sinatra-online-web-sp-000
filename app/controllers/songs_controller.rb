require 'sinatra/base'
require 'rack-flash'

class SongsController< ApplicationController
  enable :sessions
  use Rack::Flash

    get '/songs' do 
        @songs=Song.all
        erb :'/songs/index'   
      end
    
    get '/songs/new' do
      @genres=Genre.all
      erb :'/songs/new'
    end

    post "/songs" do 
      song_artist=Artist.find_or_create_by(name: params["Artist Name"])
      genre=Genre.find_by(name: params["genres"])
      @songs=Song.create(name: params["Name"], artist_id: song_artist.id)
      song_genre=SongGenre.create(song_id: @songs.id, genre_id: genre.id)
      flash[:message] = "Successfully created song."
      redirect "songs/#{@songs.slug}"
    end

    get '/songs/:slug/edit' do 
      @songs=Song.find_by_slug(params[:slug])
      @genres=Genre.all
      erb :'songs/edit'
    end

    patch '/songs/:slug' do
      @songs=Song.find_by(name: params["Name"])
      artist=Artist.find_or_create_by(name: params["Artist Name"])
      @songs.update(artist_id: artist.id)

      song_genre=SongGenre.find_by(song_id: @songs.id)
      song_genre.update(genre_id: params["genres"].join)
      flash[:message] = "Successfully updated song."
      redirect "songs/#{@songs.slug}"
    end

    get '/songs/:slug' do
      @songs=Song.find_by_slug(params[:slug])
      @genres=Genre.all
      erb :'/songs/show'
    end
      
   
end

