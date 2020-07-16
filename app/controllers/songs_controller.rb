class SongsController < ApplicationController
    register Sinatra::ActiveRecordExtension
    set :session_secret, "my_application_secret"
    set :views, Proc.new { File.join(root, "../views/") }
    
    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/:slug' do
        #select the song and then the artist associated with the song
        #song.genres
        @song = Song.find(params[:id])
        erb :'/songs/show'
    end

end