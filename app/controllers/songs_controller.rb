class SongsController < ApplicationController
    get '/songs' do
        @songs = Song.all
        erb :song_index
    end
    get '/songs/new' do
        # binding.pry
        # @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :song_new
    end
    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        # binding.pry
        erb :song_edit
    end
    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        # binding.pry
        # @genre = Genre.find(@song.genre_id)
        # binding.pry
        erb :song_show
    end
    post '/songs/new' do
        artist = Artist.find_or_create_by(name: params[:'Artist Name'])
        # if artist.size ==0
        #     artist=Artist.create(name: params[:'Artist Name'])
        # end
        
        song = Song.create(name: params[:'Name'])
        song.genre_id = params[:genre]
        song.artist = artist
        song.save
        # binding.pry
        puts "Successfully created song." 
        puts song.slug
        redirect "/songs/#{song.slug}"
    end
    patch '/songs/update' do #edit action
        @song = Song.find_by_id(params[:id])
        if params[:'Artist Name'] != ""
            @song.artist = Artist.find_or_create_by(name: params[:'Artist Name'])
        end
        if params[:'genre'] != ""
            @song.genre_id = params[:'genre']
        end
        @song.save
        puts @song.slug
        # binding.pry
        redirect "/songs/#{@song.slug}"
    end
end
