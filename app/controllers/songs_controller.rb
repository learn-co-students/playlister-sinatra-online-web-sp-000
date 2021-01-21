class SongsController < ApplicationController
    require 'rack-flash'
    use Rack::Flash

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end
    
    get '/songs/new' do
        @genres = Genre.all
        erb :'/songs/new'
    end

    post '/songs' do
        song = Song.new
        song.name = params[:name]
        song.artist_id = Artist.find_or_create_by(name: params[:artist_name]).id
        song.save

        params[:genre_ids].each {|genre_id| SongGenre.create({:song_id => song.id, :genre_id => genre_id})}

        flash[:message] = "Successfully created song."
        redirect to "/songs/#{song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :'/songs/edit'
    end

    patch '/songs/:slug' do
        song = Song.find_by_slug(params[:slug])
        song.name = params[:name]
        song.artist_id = Artist.find_or_create_by(name: params[:artist_name]).id
        song.save

        SongGenre.where(song_id: song.id).destroy_all
        params[:genre_ids].each {|genre_id| SongGenre.create({:song_id => song.id, :genre_id => genre_id})}

        flash[:message] = "Successfully updated song."
        redirect to "/songs/#{song.slug}"
    end
end