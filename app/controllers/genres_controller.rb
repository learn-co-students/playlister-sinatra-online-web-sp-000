class GenresController < ApplicationController

    # create

    # read
    get '/genres' do
        @genres = Genre.all
        erb :'/genres/index'
    end

    get '/genres/:slug' do
        @genre = Genre.find_by_slug(params[:slug])             
        erb :'/genres/show'
    end

    # update

    # delete

end