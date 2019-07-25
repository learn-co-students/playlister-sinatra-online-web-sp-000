class ArtistsController < ApplicationController
<<<<<<< HEAD
  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end
=======
  get '/artists' do 
    @artists = Artist.all
    erb :index 
  end 
  
  get '/artists/:slug' do 
    @artist = Artist.find_by_slug(params[:slug])
    erb :show
  end 
>>>>>>> 9124cd55a1b9034daf5e4982762b9ec4ee70aca8
end
