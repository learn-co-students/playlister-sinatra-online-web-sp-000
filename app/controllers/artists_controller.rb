class ArtistsController < ApplicationController
  get '/artists' 
    @artists = Artist.all
  end
  
end
