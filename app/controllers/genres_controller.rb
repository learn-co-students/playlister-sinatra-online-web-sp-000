class GenresController < ApplicationController

    get '/genres' do
        @genres = Genre.all.sort_by { |genre| genre.name }
        erb :'genres/index'
    end

end
