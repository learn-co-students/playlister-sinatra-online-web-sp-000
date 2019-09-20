class GenresController < ApplicationController

#This should present the user with a list of all genres in the library.
#Each genre should be a clickable link to that particular genre's show page.
  get '/genres' do
    @genres = Genre.all

    erb :'/genres/index'
  end

#Any given genre's show page should have links to each of its artists and songs.
  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end
end
