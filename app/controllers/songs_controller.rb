class SongsController < ApplicationController

    @@message = ""

    get '/songs' do 
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/new' do
        erb :'/songs/new'
    end

    post '/songs' do 
        song = Song.create(params[:song])
        song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        song.artist.songs << song 
        song.genre_ids = params[:genres]
        @@message = "Successfully created song."
        redirect "/songs/#{song.slug}"
    end

    get '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show', locals: {message: @@message}
    end

    get '/songs/:slug/edit' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/edit'
    end

    patch '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song]) if params[:song][:name] != ""
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name]) if params[:artist][:name] != ""
        @song.artist.songs << @song 
        @song.genre_ids = params[:genres]
        @song.save
        @@message = "Successfully updated song."
        redirect "/songs/#{@song.slug}"
    end

end