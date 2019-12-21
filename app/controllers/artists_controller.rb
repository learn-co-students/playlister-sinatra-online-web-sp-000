class ArtistsController < ApplicationController
  
  
  get "/" do 
    erb :'/artists/index'
  end
 

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end
  
  
  
end
