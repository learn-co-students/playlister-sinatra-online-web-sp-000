class GenresController < ApplicationController

  get '/genres' do
    @all_genres = Genre.all
    erb :genres_index
  end

end
