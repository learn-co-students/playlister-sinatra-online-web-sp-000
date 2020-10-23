class ArtistsController < ApplicationController
    
    get '/songs/new' do
    end 
    
    get '/songs' do
        @songs = Song.all        
        erb :'/songs/show/' 
    end

    get '/songs/:slug/edit' do
    end

    get '/genres' do
        @genres = Genre.all
        erb :'/genres/show'
    end

    get '/artists' do
        @artists = Artist.all
        erb :'/artists/show'
    end

    get '/songs/:slug' do        
    end

    get '/artists/:slug' do   
    end

    get '/genres/:slug' do     
    end
  
end
