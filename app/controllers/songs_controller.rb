require 'rack-flash'

class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods

    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        @artists = Artist.all
        @songs = Song.all
        @genres = Genre.all
        erb :'songs/new'
    end
    
    post '/songs' do
       @song = Song.create(name: params["Name"])
       @song.artist = Artist.find_or_create_by(name: params["artist_name"])
       #@song.genres = Genre.find_by_id(params["genre"])
       params["genres"].each do |genre|
            @song.genres << Genre.find_by_id(genre)
       end
       @song.save
       flash[:message] = "Successfully created song."
       redirect to "songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params["slug"])
        erb :'songs/show'
    end

    get '/songs/:slug/edit' do
        @artists = Artist.all
        @songs = Song.all
        @genres = Genre.all
        @song = Song.find_by_slug(params["slug"])
        erb :'songs/edit'
    end

    patch '/songs/:slug' do
        #binding.pry
        @song = Song.find_by_slug(params["slug"])
        @song.artist = Artist.find_or_create_by(name: params["artist_name"])
        @song.save
        erb :"songs/show"
    end

end