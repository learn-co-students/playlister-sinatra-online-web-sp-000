class SongsController < ApplicationController

    get '/songs' do
        #get all songs as variable
        #display songs in erb with clickable link to song's show page
        @songs = Song.all 
        erb :'songs/index'
    end

    get '/songs/:slug' do 
        #song's show page has links to song's artist and genre associated with song
        #Pay attention to order here with order compared to /songs/new--slug must be defined first
    end

    #will also have new and show (posts?)
end
