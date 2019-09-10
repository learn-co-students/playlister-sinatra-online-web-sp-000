
class SongsController < ApplicationController
  
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end  

  post '/songs' do    
    if Song.exists?(name: params["Name"])
      @song = Song.find_by(name: params["Name"])
    else
      @song = Song.create(name: params["Name"])
    end
    if params["Artist Name"] != "" 
      if @song.artist == nil  
        if Artist.exists?(name: params["Artist Name"])
          @song.artist = Artist.find_by(name: params["Artist Name"])
        else
          @song.artist = Artist.create(name: params["Artist Name"])
        end
      end
      if params["genres"].size > 0        
        params["genres"].each do |g| 
          @song.genres << Genre.find(g.to_i)
        end
      end
    end
    @song.save
    redirect to ("/songs/#{@song.slug}?action=created")
  end

  patch '/songs' do 
    @song = Song.find_by(name: params["Name"])
    if params["Artist Name"] != "" 
      if Artist.exists?(name: params["Artist Name"])
        @song.artist = Artist.find_by(name: params["Artist Name"])
      else
        @song.artist.update(name: params["Artist Name"])
      end
      
      @song.genres.clear
      if params["genres"].size > 0        
        params["genres"].each do |g| 
          @song.genres << Genre.find(g.to_i)
        end
      end
    end
    @song.save    
    redirect to ("/songs/#{@song.slug}?action=updated")
  end

  get '/songs/:slug' do   
    if params[:slug] == "new"      
      erb :'/songs/new'
    else
      @song = Song.find_by_slug(params[:slug])
      @genres = @song.genres
      @action = params[:action]
      erb :'/songs/show'
    end
  end

  get '/songs/:slug/edit' do   
    @song = Song.find_by_slug(params[:slug])
    @genres = @song.genres
    erb :'/songs/edit'
  end

  helpers do
    def self.exists_name?(name)
      nil
    end
  end

  
end

