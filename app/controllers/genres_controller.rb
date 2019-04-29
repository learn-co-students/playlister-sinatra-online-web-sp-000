class GenresController < ApplicationController
  get '/genres' do
    erb :'genres/index'
  end

  get '/genres/:genre_name' do
    @genre = Genre.find_by_slug(params[:genre_name])
    erb :'genres/show'
  end
end
