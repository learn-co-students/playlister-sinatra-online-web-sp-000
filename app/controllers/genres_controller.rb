class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :"/genres/index"
  end

  get '/genres/:slug' do
    genre = params[:slug]
    @genres = Genre.find_by_slug(genre)
    # binding.pry
    erb :"/genres/show"
end
end