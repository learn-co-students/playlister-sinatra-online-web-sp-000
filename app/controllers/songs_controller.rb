class SongsController < ApplicationController
    get '/songs' do
        @songs = Song.all
        erb :songs
    end

    get '/songs/new' do
        @genres = Genre.all
        # @artists = Artist.all
        erb :new_song
    end

    post '/songs/new' do
        @artist = Artist.find_by(:name => params["Artist Name"])
        
        if @artist.nil?
            @artist = Artist.create(name: params["Artist Name"])
        end
        @song = Song.create( name: params["Name"], genre_ids: params["genres"], :artist => @artist)
        # binding.pry
        
        redirect "/songs/#{@song.slug}", 303, "Successfully created song."
    end
    
    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :show_song
    end

end
