class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all.sort_by { |song| song.name }
        erb :'songs/index'
    end

    get '/songs/:slug' do
        @song = Song.all.find_by_slug(params[:slug])
        @artist = @song.artist
        @genres = @song.genres
        erb :'songs/show'
    end

end