class GenresController < ApplicationController

    get '/genres' do
        @genres = Genre.all
        erb :'genres/index'
    end

    get '/1' do
        "this is 1"
    end

    get "/genres/:slug" do
        @genre = Genre.find_by_slug(params[:slug])
        # @artists = @genre.artists
 
        erb :'genres/show'
    end



end
