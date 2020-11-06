require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'/songs/new'
    end

    post '/songs' do
        @song = Song.create(name: params[:song][:name])
        artist = Artist.find_or_create_by(name: params[:artist][:name])
        genre_ids = params[:song][:genres]
        genre_ids.each do |id|
            genre = Genre.find(id)
            @song.genres << genre
        end
        @song.artist = artist
        @song.save

        flash[:message] = "Successfully created song."
        redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    get '/songs/:slug/edit' do
        slug = params[:slug]
        @song = Song.find_by_slug(slug)
        @genres = Genre.all
        erb :'/songs/edit'
    end

    patch '/songs/:slug' do
        song = Song.find_by_slug(params[:slug])

        song.genres.clear
        genre_ids = params[:song][:genres]
        genre_ids.each do |id|
            genre = Genre.find(id)
            song.genres << genre
        end
        
        artist = Artist.find_or_create_by(name: params[:song][:artist])
        song.artist = artist
        
        song.save

        flash[:message] = "Successfully updated song."
        redirect to "songs/#{song.slug}"
    end
end