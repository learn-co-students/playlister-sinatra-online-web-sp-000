class GenresController < ApplicationController
    get '/genres' do
        @genres = Genre.all

        erb :'genres/index'
    end

    get '/genres/:slug' do
        @genre = Slugify.find_by_slug(Genre, params[:slug])

        erb :'/genres/show'
    end
end