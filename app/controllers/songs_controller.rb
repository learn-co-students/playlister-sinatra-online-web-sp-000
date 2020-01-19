class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :songs
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(:slug)
        erb :show
    end

end
