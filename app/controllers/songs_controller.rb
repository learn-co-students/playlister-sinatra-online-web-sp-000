class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash
    
    # create

    get '/songs/new' do
        @songs = Song.all
        @genres = Genre.all
        erb :'/songs/new'
    end

    post '/songs' do
        artist = Artist.find_or_create_by(params[:artist])
        song = artist.songs.create(params[:song])

        flash[:message] = "Successfully created song."

        redirect "/songs/#{song.slug}"
    end

    # read
    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    # update
    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :'/songs/edit'
    end

    patch '/songs/:slug' do
        artist = Artist.find_or_create_by(params[:artist])
        song = Song.find_by_slug(params[:slug])
        song.update(name: params[:song][:name], artist: artist, genre_ids: params[:song][:genre_ids])

        flash[:message] = "Successfully updated song."

        redirect "/songs/#{song.slug}"
    end

    # delete

end