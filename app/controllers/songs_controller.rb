class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'/songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :'/songs/edit'
    end

    post '/songs/new' do
        song = Song.new
        song.name = params[:song][:name]
        song.artist = Artist.find_or_create_by(name: params[:song][:artist][:name])
        params[:song][:genre].each {|genre| song.genres << Genre.find_by(name: genre[:name])}
        song.save
        session[:status] = "new"
        redirect to "/songs/#{song.slug}"
    end

    patch '/songs/:slug' do
        song = Song.find_by_slug(params[:slug])
        song.name = params[:song][:name]
        song.artist = Artist.find_or_create_by(name: params[:song][:artist][:name])
        song.genres.clear
        params[:song][:genre].each {|genre| song.genres << Genre.find_by(name: genre[:name])}
        song.save
        session[:status] = "edited"
        redirect to "/songs/#{song.slug}"
    end

end