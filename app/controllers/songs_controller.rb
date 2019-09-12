require 'pry'
require 'rack-flash'

class SongsController < ApplicationController
    use Rack::Flash

    get '/songs' do
        @songs = Song.all 
        erb :'songs/index'
    end

    get '/songs/new' do
        @artists = Artist.all
        erb :'songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

     post '/songs' do
        artist = Artist.find_or_create_by(name: params[:Artist])
        genres = Genre.find(params[:genres])
        @song = Song.create(name:params[:Name], genres:genres, artist:artist)
        flash[:message] = "Successfully created song."
        redirect to ("songs/#{@song.slug}")
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @artist = Artist.find_or_create_by(name:params[:Artist])
        @genres = Genre.find(params[:genres])
        @song.update(name: params[:Name], artist:@artist, genres:@genres)

        flash[:message] = "Successfully updated song."
        redirect "songs/#{@song.slug}"
    end

end
