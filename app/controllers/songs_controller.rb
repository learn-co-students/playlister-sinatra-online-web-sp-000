class SongsController < ApplicationController
    get '/songs' do
        @songs = Song.all
        erb :songs
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :new_song
    end

    post '/songs/new' do
        @artist = Artist.find_by(:name => params["Artist Name"])
        if @artist.nil?
            @artist = Artist.create(name: params["Artist Name"])
        end
        @song = Song.create( name: params["Name"], genre_ids: params["genres"], :artist => @artist)
        redirect "/songs/#{@song.slug}", 303, "Successfully created song."
    end
    
    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :edit_song
    end

    post '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @artist = Artist.find_or_create_by(:name => params["Artist Name"]) 
        @song.artist = @artist
        @song.save
        @song.genres.clear()
        params[:genres].each do |p|
            @song.genres << Genre.find_or_create_by(name: p)
        end
        redirect to("/songs/#{@song.slug}")
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :show_song
    end

end
