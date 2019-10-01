class SongsController < ApplicationController
    
    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/new' do
        erb :'/songs/new'
    end

    post '/songs' do
        #params make a song
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    get '/songs/:slug/edit' do
        #params find song
        erb :'/songs/edit'
    end
    
    patch '/songs/:id' do
        #params edits the song
    end

end
