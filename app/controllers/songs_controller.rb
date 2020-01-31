class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get "/songs/new" do
        @slug = "null"
        @artists = Artist.all
        @genres = Genre.all
        erb:"songs/new"
    end

    post '/songs' do
        @song = Song.create(params[:song])

        # params[:song][:genre_ids].each do | genre_id |
        # @song.genres << Genre.find(genre_id)
        # end

    
        
        if !params["artist_name"].empty?
            @artist = Artist.create(name: params["artist_name"])
            @song.artist = @artist
        end
        if !params["genre_name"].empty?
            @song.genres = Genre.create(name: params["genre_name"])
        end
        @song.save
        redirect to "/songs/#{@song.slug}"
    end

    patch  "/songs/:slug" do
        
        @song = Song.find_by_slug(params[:slug])
        binding.pry
        @song.update(params[:song])

       
        if !params["artist_name"].empty?
            @artist = Artist.create(name: params["artist_name"])
            @song.artist = @artist
        end
        
        if !params["genre_name"].empty?
            @genre = Genre.create(name: params["genre_name"])
            @song.genres = []
            @song.genres << @genre
        end
        @song.save

        redirect to "songs/#{@song.slug}"
    end


    get "/songs/:slug" do
        @song = Song.find_by_slug(params[:slug])
     
        erb :"songs/show"
    end

    get "/songs/:slug/edit" do
        @artists = Artist.all
        @genres = Genre.all
        @song = Song.find_by_slug(params[:slug])
        
        @artist = @song.artist
        
        erb :'songs/edit'
    end

  
    

end
