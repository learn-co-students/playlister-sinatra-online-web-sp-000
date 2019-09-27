
#require 'sinatra/base'
#require 'rack-flash'

class SongsController < ApplicationController
  #enable :sessions
  #use Rack::Flash  

  get "/songs" do 
    @songs = Song.all 
    erb :'/songs/index'
  end
  
  get "/songs/new" do 
    @genres = Genre.all 
    @artists = Artist.all
    erb :'songs/new'
  end
  
  post "/songs" do 
    
    if params["song"]["name"] == ""
       redirect to "songs"
     end
     
    @song = Song.create(params[:song])
    
      if !params["artist"]["name"].empty?
        if @artist = Artist.find_by(name: params["artist"]["name"])
        @song.artist = @artist
        @song.save
        else
        @song.artist = Artist.create(name: params["artist"]["name"])
        @song.save
        end 
      else params["artist"]["name"] == ""
        @song.artist = nil
        @song.save
      end
    #flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end
  
  get "/songs/:slug" do 
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end
  
  get "/songs/:slug/edit" do 
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all 
    @artists = Artist.all
    erb :'songs/edit'
  end
  
  patch '/songs/:slug' do 

    if !params[:song].keys.include?("artist_id")
    params[:song]["artist_id"] = []
    end
    @song = Song.find_by_slug(params[:slug])
    @song.update(params["song"])
   
      if !params["artist"]["name"].empty?
        if @artist = Artist.find_by(name: params["artist"]["name"])
        @song.artist = @artist
        @song.save
        else
        @song.artist = Artist.create(name: params["artist"]["name"])
        @song.save
        end 
      else params["artist"]["name"] == ""
        @song.artist = nil
        @song.save
      end
      #  if !params["artist"]["name"].empty?
      #  @song.artist = Artist.create(name: params["artist"]["name"])
      #  @song.save
      #elsif params["artist"]["name"] == ""
      #  @song.artist = nil
      #  @song.save
      #elsif  @artist = Artist.find(params["artist"]["name"])
      #  @song.artist = @artist
      #  @song.save
    
    redirect to "/songs"
  end

end