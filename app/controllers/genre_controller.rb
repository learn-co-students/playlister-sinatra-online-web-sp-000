class GenreController < ApplicationController

    get '/genres' do
        @genres = Genre.all
        erb :"genres/genres"
    end

    get '/genres/new' do
        erb :"genres/new"
    end

    get '/genres/:slug' do
        @genre = Genre.find_by_slug(params[:slug])
        @artists = @genre.artists
        @songs = @genre.songs
        erb :"genres/slug"
    end
end