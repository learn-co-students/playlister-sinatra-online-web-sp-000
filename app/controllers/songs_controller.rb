class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all 
        erb :'songs/index'
    end

    get '/songs/:slug' do 
        erb :'songs/show'
        #song's show page has links to song's artist and genre associated with song
        #Pay attention to order here with order compared to /songs/new--slug must be defined first
    end

    #will also have new and show (posts?)
end
