class GenresController < ApplicationController
   
    get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
    end
         
    get '/genres/:slug' do
    "heres the genre show page"
    end
end