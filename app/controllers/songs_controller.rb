require 'rack-flash' # as long as we are requiring certain gem within the file
class SongsController < ApplicationController
    use Rack::Flash # gem coming from our Gemfile, telling the controller that we will have flash messages coming in.
    get '/songs' do
        @songs = Song.all 
        erb :'/songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all 
        @artists = Artist.all
        erb :'/songs/new'
    end

    post '/songs' do 
        #binding.pry
        @song = Song.create(params[:song])
            @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
            @song.genre_ids = params["genre_ids"]
        @song.save
        flash[:message] = "Successfully created song."
        redirect to "songs/#{@song.slug}" 
    end

    get '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    get '/songs/:slug/edit' do
        @genres = Genre.all
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/edit'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        #binding.pry
        @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
        @song.genre_ids = params["genre_ids"]
        @song.save
        flash[:message] = "Successfully updated song."
        redirect to "songs/#{@song.slug}"
    end
end