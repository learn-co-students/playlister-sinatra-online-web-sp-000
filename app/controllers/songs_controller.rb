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
        @song = Song.create( name: params["name"], genre_ids: params["genres"], artist: Artist.create(name: params["Artist Name"]))
        # @song.save
        # binding.pry
        redirect to("/songs/#{@song.slug}")
        # binding.pry
    end
    
    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :show_song
    end

end
