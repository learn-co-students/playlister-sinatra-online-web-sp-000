require 'rack-flash'

class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash

    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        erb :'songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    post '/songs' do
        #binding.pry
        @song = Song.create(name: params[:Name])
        @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
        genres = params[:genre_name]
        genres.each {|genre| @song.genres << Genre.find_by(name: genre)}
        @song.genres << Genre.create(params[:genre]) if params[:genre][:name] != ''
        @song.save
        flash[:message] = "Successfully created song."
        redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end

    patch '/songs/:slug' do
        binding.pry
        @song = Song.find_by_slug(params[:slug])
        @song.update(name: params[:Name])
        @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
        @song.genres.clear
        params[:genres].each {|genre| @song.genres << Genre.find_or_create_by(name: genre)}
        @song.save
        flash[:message] = "Successfully updated song."
        erb :'songs/show'
        #redirect "/songs/#{song.slug}"
    end
end