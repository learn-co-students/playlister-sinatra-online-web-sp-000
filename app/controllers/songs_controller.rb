require 'rack-flash'
class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash

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
       
        flash[:notice] = "Successfully created song."
        if !params["artist_name"].empty? && !Artist.find_by(name: params["artist_name"])
            @artist = Artist.create(name: params["artist_name"])
            @song.artist = @artist
        else
            @song.artist = Artist.find_by(name: params["artist_name"])
        end
        if !params["genre_name"].empty?
            @song.genres = Genre.create(name: params["genre_name"])
        end
 
        @song.save
        redirect to "/songs/#{@song.slug}"
    end

    patch  "/songs/:slug" do
        if !params[:song].keys.include?("genre_ids")
            params[:song]["genre_ids"] = []
            end
        @song = Song.find_by_slug(params[:slug])

        @song.update(params[:song])

        flash[:notice] = "Successfully updated song."
       
        if !params["artist_name"].empty? && !Artist.find_by(name: params["artist_name"])
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
