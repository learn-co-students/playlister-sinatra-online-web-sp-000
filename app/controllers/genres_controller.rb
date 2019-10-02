class GenresController < ApplicationController
  
  get '/genres' 
    @genres = Genre.all
  end
  
end
