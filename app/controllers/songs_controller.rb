class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get "/songs/new" do
        @slug = "1"
        @artists = Artist.all
        @genres = Genre.all
        erb:"songs/new"
    end

    post '/songs' do
        @song = Song.create(params[:song])
        if !params["artist_name"].empty?
            @artist = Artist.create(name: params["artist_name"])
            @song.artist = @artist
        end
        
        if !params["genre_name"].empty?
            @genre = Genre.create(name: params["genre_name"])
            @song.genre = @genre
        end
        @song.save
        redirect to "/songs/#{@song.slug}"
    end

    patch  "/songs/:slug" do
        @song =  @song = Song.find_by_slug(params[:slug])
        @song =  @artist = @song.artist
        







    end


    get "/songs/:slug" do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    get "/songs/:slug/edit" do
        @artists = Artist.all
        @genres = Genre.all
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end

  
    

end
