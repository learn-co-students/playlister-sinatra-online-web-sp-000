class GenresController < ApplicationController
    get '/genres' do
        @genres = Genre.all
       erb :"Genres/index"
    end
    get '/genres/:slug' do
        genre_name =  params[:slug]
        @genre = Genre.find_by_slug(genre_name)
        @songs = @genre.songs
        erb :"genres/show"
    end

      
end