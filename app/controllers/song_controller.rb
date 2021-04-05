

class SongsController < ApplicationController


    get '/songs' do 
        @songs = Song.all
        erb :'song/index'
    end

    get '/songs/new' do 
        @genres = Genre.all
        erb :'song/new'
    end

    post '/songs' do 
        
        LibraryParser.build_new_objects(params['song'], params['artist'], params['genres'])
        flash[:message] = "Successfully created song."
        redirect "/songs/#{Song.last.slug}"
        
    end

    get '/songs/:slug' do 
      
        @song = Song.find_by_slug(params[:slug])
        erb :'song/show'
    end

    get '/songs/:slug/edit' do
        erb :'song/edit'
    end
end