class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(paras[:slug])
        erb :'songs/show'
    end

    post '/songs' do
        @song = Song.create(params[:song])
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.genre_ids = params[:genres]
        @song.save
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(paras[:slug])
        erb :'/songs/edit'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.genre_ids = params[:genres]
        @song.save
    end
end
