class SongsController < ApplicationController

    get '/songs' do
        "hello"
        erb :'/songs/index'
    end
    # get '/songs' do
    #     binding.pry
    #     @songs = Song.all
    #     erb :songs
    # end
end
