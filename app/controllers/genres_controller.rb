class GenresController < ApplicationController
  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.all.find_by_slug(params[:slug])
    @songs = @genre.songs
    @artists = @genre.artists
    erb :'genres/show'
  end
end
