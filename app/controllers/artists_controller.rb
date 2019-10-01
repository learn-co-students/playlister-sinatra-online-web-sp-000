class ArtistsController < ApplicationController

    get '/' do

    erb '/articles/index'
    end

    get '/artists' do
        @artist = Artist.all    
    
        erb :'/articles/index'
    end

    # get 'artists/new' do
    #     @song = Song.all
    
    #     erb :'/articles/index'
    # end

    post '/artists' do
        @artist = Artist.create(:artist => params[:name])
    
        redirect to "/artists/#{@artist.id}" 
    end
   
end
