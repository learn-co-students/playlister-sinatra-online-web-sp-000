require 'pry'
class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/new' do #create
        
        erb :'/songs/new'
    end
    get '/songs/:slug' do
        #the params[:slug] part comes from get '/genres/:slug' do - 
        #so when you go to yoursite.com/Milos-Popovic 
        #it turns Milos-Popovic into params[:slug]
        #then with the line below
        #we are going through all of the existing genre instances 
        #to find one that has a slug property that is the exact same 
        #as our slug from the route, in this case "Milos-Popovic"
        @song = Song.find {|instance| instance.slug == params[:slug]}
        erb :'/songs/show'
    end
    post '/songs' do #create
        @song = Song.create(:name => params["Name"])
        @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
        @song.genre_ids = params[:genres]
        @song.save
        
        redirect "/songs/#{@song.slug}"
    end
    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
      end
    
      patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.genre_ids = params[:genres]
        @song.save
    
        erb :"/songs/show"
    
      end


end