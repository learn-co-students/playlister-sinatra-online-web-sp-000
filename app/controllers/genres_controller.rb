class GenresController < ApplicationController

    get '/genres' do
        @genres = Genre.all.sort_by { |genre| genre.name }
        erb :'genres/index'
    end

    get '/genres/:slug' do
        @genre = Genre.all.find_by_slug(params[:slug])
        @artists = @genre.artists
        @songs = @genre.songs
        erb :'genres/show'
    end

end
