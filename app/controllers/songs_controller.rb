class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash, :sweep => true
    
    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end
    
    post '/songs' do
        song = Helper.new_song(params)
        flash[:message] = "Successfully created song."
        redirect to "/songs/#{song.slug}"
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'/songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    get '/songs/:slug/edit' do
        @genres = Genre.all
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/edit'
    end

    patch '/songs/:slug' do
        song = Helper.update_song(params)
        flash[:message] = "Successfully updated song."
        redirect to "/songs/#{song.slug}"
    end
end
