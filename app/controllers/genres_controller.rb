class GenresController < ApplicationController
  
  get '/genres' do
    @genres = Genre.all
  end
  
  
end
