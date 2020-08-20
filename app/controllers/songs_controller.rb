
class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        @song
       erb :"songs/index"
    end
     get '/songs/new' do
      @artists = Artist.all
      @genres = Genre.all
        erb :'songs/new'
     end

     post '/songs' do
        @artist = Artist.find_by(name: params["Artist Name"])        
        if @artist 
          @song = Song.create(name: params["Name"], artist: @artist)
          params[:genres].each {|g| 
          @genre = Genre.find_by(name: g)
              @song.genres << @genre
          }
          
         flash[:message] = "Successfully created song."
        else
          @artist = Artist.create(name: params["Artist Name"])
          @song = Song.create(name: params["Name"], artist: @artist)
          params[:genres].each {|g| 
             @genre = Genre.find_by(name: g)
             @song.genres << @genre

          }
          
        flash[:message] = "Successfully created song."
       end
         redirect  "/songs/#{@song.slug}"
     end

     get "/songs/:slug/edit" do
      @genres = Genre.all
      slug = params[:slug]
      @song = Song.find_by_slug(slug)
      erb :"songs/edit"
     end
     patch "/songs/:slug" do
      @song = Song.find_by_slug(params[:slug])
      @artist = Artist.find_by(name: params["Artist Name"])
      @song.name = params["song_name"]
      if @artist 
        @song.artist = @artist
      else
         @artist = Artist.create(name: params["Artist Name"])
       @song.artist = @artist
      end
      @song.save
      params[:genres].each {|g|
      @genre = Genre.find_by(name: g)
      @song.genres.clear
      @song.genres
      @song.genres << @genre     
   }
      flash[:message] = "Successfully updated song."
      redirect  "/songs/#{@song.slug}"
     end

       get '/songs/:slug' do
          slug =  params[:slug]
          @song = Song.find_by_slug(slug)
          @artist = Artist.find_by(name: @song.artist.name)
          erb :"songs/show"
        end

end
