class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all.sort_by { |song| song.name }
        erb :'songs/index'
    end

    

end
