class GenresController < ApplicationController

  # This should present the user with a list of all songs in the library.
  # Each song should be a clickable link to that particular song's show page.
  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  # get '/genres/new' do
  #
  # end

  get '/genres/:slug' do
    slug = params[:slug]
    @genre = Genre.find_by_slug(slug)
    erb :'/genres/show'
  end

end
