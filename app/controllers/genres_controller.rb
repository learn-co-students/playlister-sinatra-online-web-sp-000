class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all

    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by(slug_name: params[:slug])

    @songs = @genre.songs.uniq
    @artists = @genre.artists.uniq

    erb :'/genres/show'
  end

end
