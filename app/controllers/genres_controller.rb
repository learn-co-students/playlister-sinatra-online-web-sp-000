class GenresController < ApplicationController


    get '/genres' do 
        @genres = Genre.all
        erb :'/genres/index'
    end 

    get '/genres/:slug' do 
        slug = params[:slug]
        @genres = Genre.find_by_slug(slug)
        @songs = @genres.songs
        @artist = @genres.artists
        erb :'/genres/show'
    end 


end
