require 'rack-flash'

class SongsController < ApplicationController
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
    enable :sessions
    use Rack::Flash

    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    post '/songs' do
        @song = Song.create(name: params["Name"])
        @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
        params["genres"].each do |id|
            @song.genres << Genre.find_by_id(id)
        end
        @song.save
        flash[:message] = "Successfully created song."

        redirect "/songs/#{@song.slug}"
    end

    get '/songs/new' do
        @artists = Artist.all
        @songs = Song.all
        @genres = Genre.all
        erb :'/songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params["slug"])
        flash[:message] = "Successfully created song."
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
        @song = Song.find_by_slug(params["slug"])
        @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
        @song.save
        flash[:message] = "Successfully updated song."
        erb :'songs/show'
    end
end