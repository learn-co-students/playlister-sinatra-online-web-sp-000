require 'rack-flash'

class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash

    get '/songs' do 
        @songs = Song.all
        erb :'song/index'
    end

    get '/songs/new' do 
        @genres = Genre.all
        erb :'song/new'
    end

    post '/songs' do 
        LibraryParser.build_new_objects(params['song'], params['artist'], params['genres'])
        flash[:message] = "Successfully created song."
        redirect "/songs/#{Song.last.slug}"
    end

    get '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'song/show'
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :'song/edit'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @artist = Artist.find_or_create_by(params[:artist])
        @song.artist = @artist
        @song.genre_ids = params['genres']
        @song.save
        flash[:message] = "Successfully updated song."
        redirect "/songs/#{Song.last.slug}"
    end

end